import 'package:aerium/infrastructure/email_bloc/email_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'infrastructure/api/email_api.dart';
import 'infrastructure/api/email_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton<EmailApi>(() => EmailApiImpl(client: getIt()));
  getIt.registerLazySingleton<EmailRepository>(
      () => EmailRepositoryImpl(emailApi: getIt()));

  // مقدار EmailRepository را به EmailBloc ارسال کنید
  getIt.registerFactory(() => EmailBloc(emailRepository: getIt()));
}
