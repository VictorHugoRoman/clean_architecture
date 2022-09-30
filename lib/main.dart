import 'package:clean_architecture/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/user/ui/screens/login_screen.dart';
import 'package:clean_architecture/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // inicializamos todo lo que queremos injectar y q estara disponible en toda la aplicacion
  configureDependencies();
  runApp(const MyApp());
}

class BLoCProvider extends StatelessWidget {
  const BLoCProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt.get<UserBloc>(), child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue), home: const LoginScreen());
  }
}
