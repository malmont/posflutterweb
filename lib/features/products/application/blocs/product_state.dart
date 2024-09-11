part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<Product> products;
  final PaginationMetaData metaData;
  final FilterProductParams params;
  final Variant? selectedVariant;

  const ProductState({
    required this.products,
    required this.metaData,
    required this.params,
    this.selectedVariant,
  });

  @override
  List<Object?> get props => [products, metaData, params, selectedVariant];
}

class ProductInitial extends ProductState {
  const ProductInitial({
    required super.products,
    required super.metaData,
    required super.params,
  });
}

class ProductEmpty extends ProductState {
  const ProductEmpty({
    required super.products,
    required super.metaData,
    required super.params,
  });
}

class ProductLoading extends ProductState {
  const ProductLoading({
    required super.products,
    required super.metaData,
    required super.params,
    super.selectedVariant,
  });
}

class ProductLoaded extends ProductState {
  const ProductLoaded({
    required super.products,
    required super.metaData,
    required super.params,
    super.selectedVariant,
  });
}

class ProductError extends ProductState {
  final Failure failure;
  const ProductError({
    required super.products,
    required super.metaData,
    required super.params,
    required this.failure,
    super.selectedVariant,
  });

  @override
  List<Object> get props => [failure];
}
