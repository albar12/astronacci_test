import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '/path.dart';

var di = GetIt.instance;

void initDependencies() {
  di.registerSingletonAsync<BaseStorage>(() async {
    const secureStorage = FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iOSOptions,
    );
    return BaseStorage(storage: secureStorage);
  });

  di.registerFactory<ProfileRemoteDatasource>(() => ProfileRemoteDatasource());
  di.registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasource());

  di.registerFactoryParam<AuthLocalDatasource, BaseStorage, void>(
    (storage, _) => AuthLocalDatasource(storage: storage),
  );

  di.registerFactoryParam<
    ProfileRepository,
    ProfileRemoteDatasource,
    AuthLocalDatasource
  >((remoteDataSource, localDataSource) {
    return ProfileRepositoryImpl(remoteDataSource, localDataSource);
  });

  di.registerFactoryParam<
    AuthRepository,
    AuthRemoteDatasource,
    AuthLocalDatasource
  >((remoteDataSource, localDataSource) {
    return AuthRepositoryImpl(localDataSource, remoteDataSource);
  });

  di.allReady();
}
