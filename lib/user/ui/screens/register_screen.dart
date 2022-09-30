//este widget c creo con el comando snippet flscreen

import 'package:flutter/material.dart';
import '../../../ui/inputs_decoration.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AuthBackground(
                child: SingleChildScrollView(
                    child: Column(children: [
      const SizedBox(height: 250),
      CardContainer(
          child: Column(children: [
        const SizedBox(height: 10),
        Text('Crear Cuenta', style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 30),
        _LoginForm()
        //***ChangeNotifierProvider(create: (_) => LoginFormProvider(), child: _LoginForm())
      ])),
      const SizedBox(height: 50),
      TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, 'login'), //pushReplacementNamed destruy pantalla anterior
          child: const Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 18, color: Colors.black54))),
      const SizedBox(height: 40)
    ])))));
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //***final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
        //conectamos nuestro provider LoginFormProvider mediante el key
        key: _formKey,
        //un column ya normalmente en los formularios todos los elementos estan acomodados hacia abajo uno tras otro
        child: Column(children: [
          TextFormField(
            //AutovalidateMode.onUserInteraction, c ejecuta la funcion validadora(validator) n cuanto el usuario interactua con st input
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false, //corrector
            keyboardType: TextInputType.emailAddress, //tipo de entrada
            decoration: InputDecorations.authInputDecoration(
                hintText: 'ejemplo_hot@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_rounded),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'No parece correo';
              //value ?? '' , si value es null toma el ''
            },
            onChanged: (value) => _user.text = value,
          ),
          const SizedBox(height: 30),
          TextFormField(
            //AutovalidateMode.onUserInteraction, c ejecuta la funcion validadora(validator) n cuanto el usuario interactua con st input
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true, //input to password
            autocorrect: false, //corrector
            keyboardType: TextInputType.emailAddress, //tipo de entrada
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****', labelText: 'Contraseña', prefixIcon: Icons.lock_outline),
            validator: (value) {
              //(value != null && value.length >= 6), si (value != null) es falso ya no valida (value.length >= 6) porque estamos usando un and , como C#
              if (value != null && value.length >= 6) return null;
              return 'Requiere minimo 6 caracteres';
              //value ?? '' , si value es null toma el ''
            },
            onChanged: (value) => pass.text = value,
          ),
          const SizedBox(height: 30),
          MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 3,
              color: Colors.deepPurple,
              onPressed: () async {
                //para ocultar el teclado
                FocusScope.of(context).unfocus();
                // final authService = Provider.of<AuthService>(context, listen: false);

                // if (!loginForm.isValidForm()) return;

                // loginForm.isLoading = true;
                // //el pfr usa un await con l navigator Navigator.pushReplacementNamed q st manda un warning d no usar en un await
                // //await Future.delayed(const Duration(seconds: 3));

                // final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);
                // if (errorMessage == null) {
                //   //pushReplacementNamed, destruye el stack de las pantallas y t renderiz nst caso a home. ya no c puede navegar hacia atras
                //   Navigator.pushReplacementNamed(context, 'home');
                // } else {
                //   print(errorMessage);
                // }
                // loginForm.isLoading = false;
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text('Crear', style: TextStyle(color: Colors.white)))),
          const SizedBox(height: 30)
        ]));
  }
}

/** el prfr usa esta configuracion del container cuadno inicia con el yaq l sirve de referencia hasta donde abarca
 *  Container(
            width: double.infinity,
            height: 300,
            color: Colors.red,
          ),
 */
