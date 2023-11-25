import 'package:app_nation_case_study/data/services/breeds_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'domain/bloc/dialog/dialog_bloc.dart';
import 'domain/bloc/home/home_bloc.dart';
import 'domain/repository/breends/breeds_repository.dart';
import 'domain/repository/breends/i_breends_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
// Services
  locator.registerLazySingleton<BreedsService>(() => BreedsService());

  // Repositories
  final breedsRepository = BreedsRepository(locator<BreedsService>());

  // Interfaces Repositories
  locator.registerLazySingleton<IBreedsRepository>(() => breedsRepository);

  //Blocs
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator<IBreedsRepository>(),));
  locator.registerFactory<DialogBloc>(() => DialogBloc(locator<IBreedsRepository>()));
}
