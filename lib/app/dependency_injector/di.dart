part of 'import.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Secure Storage
  final secureStorageService = SecureStorageService();
  getIt.registerSingleton<SecureStorageService>(secureStorageService);

  // Token Interceptor
  final tokenInterceptor = TokenInterceptor(
    secureStorageService: getIt<SecureStorageService>(),
  );
  getIt.registerSingleton<TokenInterceptor>(tokenInterceptor);

  // API Clients
  getIt.registerSingleton<PublicApiClient>(PublicApiClient());
  getIt.registerSingleton<AuthApiClient>(
    AuthApiClient(tokenInterceptor: getIt<TokenInterceptor>()),
  );

  // Network Service - updated to not use shared preferences for token handling
  getIt.registerSingleton<NetworkService>(
    NetworkService.initializeWithDependencies(
      tokenInterceptor: getIt<TokenInterceptor>(),
      apiClient: getIt<AuthApiClient>(),
      sharedPrefs: getIt<SharedPreferences>(),
    ),
  );

  // Base Services
  getIt.registerFactory<PublicBaseService>(
    () => PublicBaseService(getIt<PublicApiClient>()),
  );
  getIt.registerFactory<AuthBaseService>(
    () => AuthBaseService(getIt<AuthApiClient>()),
  );

  // // Specific Services
  // getIt.registerFactory<AuthService>(
  //   () => AuthService(getIt<AuthBaseService>()),
  // );
  // getIt.registerFactory<PublicService>(
  //   () => PublicService(getIt<PublicBaseService>()),
  // );

  // Login Repository
  // Remote DataSource
  getIt.registerFactory<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );
  // Local DataSource
  // Local DS
  getIt.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSource(getIt<SharedPreferences>()),
  );
  // Repository
  getIt.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDataSource: getIt<LoginRemoteDataSource>(),
      localDataSource: getIt<LoginLocalDataSource>(),
    ),
  );

  // authentication
  // auth local datasource
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<SharedPreferences>()),
  );

  // auth repository
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      networkService: getIt<NetworkService>(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  // register
  // register remote datasource
  getIt.registerFactory<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );

  // register repository
  getIt.registerFactory<RegisterRepository>(
    () => RegisterRepositoryImpl(
      remoteDataSource: getIt<RegisterRemoteDataSource>(),
    ),
  );

  // home
  // home remote datasource
  getIt.registerFactory<HomeRemoteDataSources>(
    () => HomeRemoteDataSources(baseService: getIt<PublicBaseService>()),
  );

  // home repository
  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSources: getIt<HomeRemoteDataSources>()),
  );

  // Profile Repository
  // Local DataSource
  getIt.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSource(getIt<SharedPreferences>()),
  );
  // Repository
  getIt.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileLocalDataSource: getIt<ProfileLocalDataSource>(),
    ),
  );

  //data
  //data remote datasource
  getIt.registerFactory<DataRemoteDataSource>(
    () => DataRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );

  //data repository
  getIt.registerFactory<DataRepository>(
    () => DataRepositoryImpl(dataSource: getIt<DataRemoteDataSource>()),
  );

  // toko
  // toko data source
  getIt.registerFactory<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );

  // toko repository
  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: getIt<ProductRemoteDataSource>(),
    ),
  );

  //detail product
  //detail data source
  getIt.registerFactory<DetailProductRemoteDataSource>(
    () =>
        DetailProductRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );

  //detail repository
  getIt.registerFactory<DetailProductRepository>(
    () => DetailProductRepositoryImpl(
      remoteDataSource: getIt<DetailProductRemoteDataSource>(),
    ),
  );

  // detail toko
  // detail toko remote datasource
  getIt.registerFactory<TokoProductRemoteDataSource>(
    () => TokoProductRemoteDataSource(baseService: getIt<PublicBaseService>()),
  );

  // detail toko repository
  getIt.registerFactory<TokoProductRepository>(
    () => TokoProductRepositoryImpl(
      remoteDataSource: getIt<TokoProductRemoteDataSource>(),
    ),
  );
}
