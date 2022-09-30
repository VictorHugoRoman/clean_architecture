//este widget se creo con el comando snippet statelessW

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        //Stack, widget para sobreponer wisdgets
        child: Stack(children: [
          //background purple and white
          const _PurpleBox(),
          //icono user header
          const _HeaderIcon(),
          //widget q estara mas al frente
          child
        ]));
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SafeArea, wdiget q detecta a dispositivo con notch y automaticamente acomoda los elementos que tapa
    return SafeArea(
        child: Container(
            width: double.infinity,
            height: 100,
            //color: Colors.red,
            margin: const EdgeInsets.only(top: 30), //margin top
            child: const Icon(Icons.person_pin, color: Colors.white, size: 80)));
  }
}

//widget para crear el fondo ocupando la parte alta(40%) de la pantalla
class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //tomamos el tamaña de la pantalla
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.4, //40% alto pantalla
        decoration: _purpleBackground(),
        //Stack, widget para sobreponer widgets
        child: Stack(children: [
          //burbujas
          //Positioned, ponemos al child, en la posicion q tenganmos en top y lef
          Positioned(top: -50, left: 10, child: _Bubble()),
          Positioned(top: 50, left: 250, child: _Bubble()),
          Positioned(top: 110, left: 80, child: _Bubble()),
          Positioned(top: 250, left: 10, child: _Bubble()),
          Positioned(top: 200, left: 290, child: _Bubble())
        ]));
  }

//widget para colorear la parte de arriba del fondo del login
  BoxDecoration _purpleBackground() => const BoxDecoration(
      gradient: LinearGradient(colors: [Color.fromRGBO(63, 63, 156, 1), Color.fromRGBO(90, 70, 178, 1)]));
}

//widget que crea una burbuja
class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color.fromRGBO(255, 255, 255, 0.05)));
  }
}
