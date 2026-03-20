import 'package:fruit_hub_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/orders/domain/repos/orders_repo.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/products_repo/product_repo.dart';
import '../repos/products_repo/product_repo_impl.dart';
import 'database_service.dart';
import 'firestore_service.dart';
import 'storage_service.dart';
import 'supabase_storage_service.dart';

final getit = GetIt.instance;

void setupServicesLocator() {
  // getit.registerSingleton<StorageService>(FireStorage());
  getit.registerSingleton<StorageService>(SupabaseStorageService());

  getit.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getit.get<StorageService>()),
  );
  getit.registerSingleton<DatabaseService>(FirestoreService());
  getit.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: getit.get<DatabaseService>()),
  );
  getit.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(service: getit.get<DatabaseService>()),
  );
}
