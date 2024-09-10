import 'package:pos_flutter/features/products/domain/entities/categoty/category.dart';

class FilterProductParams {
  final String? keyword;
  final List<Category> categories;
  final double minPrice;
  final double maxPrice;
  final int? limit;
  final int? pageSize;

  const FilterProductParams({
    this.keyword = '',
    this.categories = const [],
    this.minPrice = 0,
    this.maxPrice = 10000,
    this.limit = 1,
    this.pageSize = 12,
  });

  FilterProductParams copyWith({
    String? keyword,
    List<Category>? categories,
    double? minPrice,
    double? maxPrice,
    int? limit,
    int? pageSize,
  }) =>
      FilterProductParams(
        keyword: keyword ?? this.keyword,
        categories: categories ?? this.categories,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        limit: limit ?? this.limit,
        pageSize: pageSize ?? this.pageSize,
      );
}
