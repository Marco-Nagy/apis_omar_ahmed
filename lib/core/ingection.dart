import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/data_sources/GarasWebsevice/GarasWebService.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Features/feature/data/data_sources/web_services.dart';
import '../Features/feature/data/repositories/users_repo.dart';
import '../Features/feature/presentation/providers/user_provider.dart';

final getIt = GetIt.instance;

void initGetIt() {
  ///! Providers
  getIt.registerLazySingleton<UserProvider>(() => UserProvider(getIt()));
  getIt.registerLazySingleton<DailyJournalProvider>(() => DailyJournalProvider(
        getIt(),
      ));

  ///! Repositories
  getIt.registerLazySingleton<UsersRepo>(() => UsersRepo(getIt()));

  ///! WebServices
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));

  getIt.registerLazySingleton<GarasWebServices>(() => GarasWebServices());

// Alternatively you could write it if you don't like global variables
  ///GetIt.I.registerSingleton<AppModel>(AppModel());
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 10 * 2000
    ..options.receiveTimeout = 10 * 5000;
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    responseHeader: false,
    requestHeader: false,
    requestBody: true,
    request: true,
  ));
  return dio;
}
