//este widget se creo con el comando snippet statelessW
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Padding, ocupa todo el espacio donde se pone pero nos permite agregar paddin a su child
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400, //fijamos altura para q c muestre, ya no tiene elementoss
            decoration: _createCardShape(),
            child: child));
  }

  BoxDecoration _createCardShape() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25),
          //sombra alredore de los bordes
          boxShadow: const [
            BoxShadow(
                //color de sombra
                color: Colors.black12,
                //que tanto c expande la sombra
                blurRadius: 15,
                //posicion d la sombra
                offset: Offset(0, 0))
          ]);
}

/** el prfr usa esta configuracion del container cuadno inicia con el yaq l sirve de referencia hasta donde abarca
 *  Container(
            width: double.infinity,
            height: 300, //los widget contenedores si no tienen childrens no tienen altura, es decir no c muestran
            color: Colors.red,
          ),
 */
