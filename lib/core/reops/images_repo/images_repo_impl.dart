import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../utils/backend_endpoints.dart';
import '../../errors/failures.dart';
import '../../services/storage_service.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  ImagesRepoImpl(this.storageService);
  final StorageService storageService;

  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndpoints.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to upload image'),
      );
    }
  }
}
