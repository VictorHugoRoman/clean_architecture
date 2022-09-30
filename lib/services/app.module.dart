import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_architecture/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//aqui van los servicios que queremos inicilizar o instanciar servicios antes d q c levante la aplicacion, p/q esten disponibles al levantarse la app
@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();

  @injectable
  Future<SharedPreferences> get sharedPreferences async => await SharedPreferences.getInstance();

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  // @injectable
  // FirebaseFirestore get store => FirebaseFirestore.instance;

  // @injectable
  // FirebaseAuth get auth => FirebaseAuth.instance;

  // @injectable
  // AppRouter get appRouter => AppRouter();

  // @preResolve
  // Future<NotificationService> get notificationService async => await NotificationService.init();
}


//  @preResolve,  notación q significa q necesitaremos que la aplicación inicialice la función antes de
  //continuar con el resto, normalmente inicializa algo, s decir su valor de instancia no es usada
// @injectable, notacion q significa a inyectara una instancia q podra ser accedidad en toda la app
  //ejemplo: _appRouter = getIt<AppRouter>();