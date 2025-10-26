import 'package:dartz/dartz.dart';
import '../../utils/backend_endpoints.dart';
import '../../../features/add_product/data/models/product_model.dart';
import '../../services/database_service.dart';
import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../errors/failures.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  ProductsRepoImpl(this.databaseService);
  final DatabaseService databaseService;

  @override
  Future<Either<Failures, void>> addProduct(ProductEntity productEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.products,
        data: ProductModel.fromEntity(productEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
