import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/services/supabase_storage_service.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_keys.dart';
import 'core/utils/k_platform.dart';
import 'features/dashboard/presentation/views/dashboard_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Supabase initialization
  await SupabaseStorageService.initialize();
  await SupabaseStorageService.createBucket(AppKeys.fruitsImagesBucketName);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();

  Bloc.observer = CustomBlocObserver();
  runApp(const MainApp());

  if (KPlatform.isDesktop) {
    doWhenWindowReady(() {
      appWindow.minSize = Size(600, 600);
      appWindow.alignment = Alignment.center;
      appWindow.title = "FruitHub Dashboard";
      // appWindow.maximize();
      appWindow.show();
    });
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
