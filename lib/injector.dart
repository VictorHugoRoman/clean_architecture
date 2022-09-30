import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_architecture/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);


//antes de ejectuar l comando de abajo, marcara error la funcion  "$initGetIt", ya q no existe, entonces se crea al 
//ejecutar l comando ya q indicamos el nombre en la linea 9.
//flutter pub run build_runner build --delete-conflicting-outputs