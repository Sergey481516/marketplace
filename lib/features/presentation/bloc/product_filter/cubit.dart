import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/features/domain/entities/category/category_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';

@injectable
class ProductFilterCubit extends Cubit<ProductFilterEntity> {
  ProductFilterCubit() : super(const ProductFilterEntity());

  void setCursor(String? cursor) {
    emit(state.copyWith(nextCursor: cursor));
  }

  void setCategory(CategoryEntity category) {
    emit(state.copyWith(category: category));
  }

  void setFilter(ProductFilterEntity filter) {
    emit(filter);
  }

  void reset() {
    emit(ProductFilterEntity());
  }
}
