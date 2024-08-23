import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/simple_bloc_observer.dart';
import 'package:lms/core/utils/api.dart';
import 'package:lms/core/utils/app_router.dart';
import 'package:lms/features/roles_and_premission/data/remote_data_source/authority_remote_data_source.dart';
import 'package:lms/features/roles_and_premission/data/repositories/authority_repository_impl.dart';
import 'package:lms/features/roles_and_premission/domain/use_case/authority_use_case/add_authorities_use_case.dart';
import 'package:lms/features/roles_and_premission/domain/use_case/authority_use_case/get_authorities_use_case.dart';
import 'package:lms/features/roles_and_premission/presentation/manager/authoriy_cubit/authority_cubit.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorityCubit(
        AddAuthoritiesUseCase(
          authorityRepository: AuthorityRepositoryImpl(
            authorityRemoteDataSource: AuthorityRemoteDataSourceImpl(
              api: Api(Dio()),
            ),
          ),
        ),
        GetAuthoritiesUseCase(
          authorityRepository: AuthorityRepositoryImpl(
            authorityRemoteDataSource: AuthorityRemoteDataSourceImpl(
              api: Api(Dio()),
            ),
          ),
        ),
      ),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          hintColor: Colors.black,
          colorScheme: const ColorScheme.light(),
        ),
      ),
    );
  }
}
