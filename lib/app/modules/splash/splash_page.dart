import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller


  @override
  Future<void> initState()  {

    super.initState();

    Future futureA = Future.delayed(Duration(seconds: 1));
    Future futureB = controller.carregaDB();
    Future futureC = controller.loadProdutoFromApi();
    Future futureD = controller.loadProdutoGrupoFromApi();
    // Usuario
    //Future<Usuario> futureC = Usuario.get();

    Future.wait([futureA, futureB, futureC,futureD]).then((List values) async {
      //Usuario user = values[2];
      //print(user);
      Modular.to.pushReplacementNamed('/venda/');

    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
