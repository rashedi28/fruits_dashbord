import 'supabase_storage_service.dart';
import '../reops/images_repo/images_repo.dart';
import '../reops/images_repo/images_repo_impl.dart';
import '../reops/products_repo/products_repo.dart';
import '../reops/products_repo/products_repo_impl.dart';
import 'database_service.dart';
import 'firestore_service.dart';
import 'storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(getIt.get<DatabaseService>()));
}
