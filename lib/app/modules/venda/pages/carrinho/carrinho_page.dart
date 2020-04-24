import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../venda_controller.dart';
import '../../venda_module.dart';

class CarrinhoPage extends StatefulWidget {
  final String title;
  const CarrinhoPage({Key key, this.title = "Carrinho"}) : super(key: key);

  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  var controller = VendaModule.to.get<VendaController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Observer(
                  builder: (_){
                    return Column(
                        children: controller.carrinhoPage
                    );
                  }
          ),
        ],
      )
    );
  }
}
