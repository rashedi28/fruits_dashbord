import 'package:dartz/dartz.dart';
import '../../errors/failures.dart';
import '../../../features/add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(ProductEntity productEntity);
}
