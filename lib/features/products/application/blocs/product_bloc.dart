import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/features/products/domain/entities/product/filter_product_params.dart';
import 'package:pos_flutter/features/products/domain/entities/product/pagination_meta_data.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';
import 'package:pos_flutter/features/products/domain/usecases/get_product_usecase.dart';

part 'product_state.dart';
part 'product_event.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase _getProductUseCase;
  int currentPage = 1;
  bool isFetching = false;

  ProductBloc(this._getProductUseCase)
      : super(ProductInitial(
          products: const [],
          params: const FilterProductParams(),
          metaData: PaginationMetaData(
            pageSize: 12,
            limit: 1,
            total: 0,
          ),
        )) {
    on<GetProducts>(_onLoadProducts);
    on<GetMoreProducts>(_onLoadMoreProducts);
    on<SelectVariantEvent>(_onSelectVariant);
    on<ResetVariantEvent>(_onResetVariant);
  }

  void _onLoadProducts(GetProducts event, Emitter<ProductState> emit) async {
    currentPage = 1;
    isFetching = true;
    try {
      emit(ProductLoading(
        products: state.products,
        params: event.params,
        metaData: state.metaData,
      ));
      final result = await _getProductUseCase(event.params
          .copyWith(limit: currentPage, pageSize: state.metaData.pageSize));

      result.fold(
        (failure) {
          isFetching = false;
          emit(ProductError(
            products: state.products,
            params: event.params,
            metaData: state.metaData,
            failure: failure,
          ));
        },
        (productResponse) {
          isFetching = false;
          currentPage++;
          emit(ProductLoaded(
            metaData: productResponse.paginationMetaData,
            products: productResponse.products,
            params: event.params.copyWith(limit: currentPage),
          ));
        },
      );
    } catch (e) {
      isFetching = false;
      emit(ProductError(
        products: state.products,
        params: event.params,
        metaData: state.metaData,
        failure: ExceptionFailure(),
      ));
    } finally {
      isFetching = false;
    }
  }

  void _onLoadMoreProducts(
      GetMoreProducts event, Emitter<ProductState> emit) async {
    var state = this.state;

    if (state is ProductLoaded && !isFetching) {
      var total = state.metaData.total;
      var loadedProductsLength = state.products.length;

      if (loadedProductsLength < total) {
        isFetching = true;
        try {
          emit(ProductLoading(
            products: state.products,
            params: state.params,
            metaData: state.metaData,
          ));
          final result = await _getProductUseCase(state.params
              .copyWith(limit: currentPage, pageSize: state.metaData.pageSize));

          result.fold(
            (failure) {
              isFetching = false;
              emit(ProductError(
                products: state.products,
                params: state.params,
                metaData: state.metaData,
                failure: failure,
              ));
            },
            (productResponse) {
              List<Product> updatedProducts = List.from(state.products)
                ..addAll(productResponse.products);
              currentPage++;
              emit(ProductLoaded(
                metaData: productResponse
                    .paginationMetaData, // Mettre à jour les metadata
                products: updatedProducts,
                params: state.params.copyWith(limit: currentPage),
              ));
            },
          );
        } catch (e) {
          isFetching = false;
          emit(ProductError(
            products: state.products,
            params: state.params,
            metaData: state.metaData,
            failure: ExceptionFailure(),
          ));
        } finally {
          isFetching = false;
        }
      }
    }
  }

  void _onSelectVariant(SelectVariantEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final Product selectedProduct = state.products.firstWhere(
        (product) =>
            product.id ==
            event.productId, // Utilise l'ID du produit de l'événement
        orElse: () => throw Exception('Product not found'),
      );

      final Variant selectedVariant = selectedProduct.variants.firstWhere(
        (variant) =>
            variant.color.name == event.color &&
            variant.size.name == event.size,
        orElse: () => throw Exception('Variant not found'),
      );

      emit(ProductLoaded(
        products: state.products,
        metaData: state.metaData,
        params: state.params,
        selectedVariant: selectedVariant,
      ));
    }
  }

  void _onResetVariant(ResetVariantEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    if (state is ProductLoaded) {
      emit(ProductLoaded(
        products: state.products,
        params: state.params,
        metaData: state.metaData,
        selectedVariant: null,
      ));
    }
  }
}
