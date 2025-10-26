import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../../../core/reops/images_repo/images_repo.dart';
import '../../../../../core/reops/products_repo/products_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity productEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(productEntity.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (url) async {
        productEntity.imageUrl = url;
        var result = await productsRepo.addProduct(productEntity);
        result.fold((failure) {
          emit(AddProductFailure(failure.message));
        }, (r) {
          emit(AddProductSuccess());
        });
      },
    );
  }
}
