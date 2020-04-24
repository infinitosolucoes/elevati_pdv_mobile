import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../venda_controller.dart';
import '../../venda_module.dart';

class VenderPage extends StatefulWidget {
  final String title;
  const VenderPage({Key key, this.title = "Vender"}) : super(key: key);

  @override
  _VenderPageState createState() => _VenderPageState();
}

class _VenderPageState extends State<VenderPage> {
  var controller = VendaModule.to.get<VendaController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool result = false;
        if (controller.indice.length > 0) {
          controller.listarProdutos(voltar: true);
          result = false;
        } else {
          await showDialog(
              context: context,
              child: AlertDialog(
                content: Text("Você deseja realmente sair?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Sim"),
                    onPressed: () {
                      result = true;
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("Não"),
                    onPressed: () {
                      result = false;
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
        }
        return result;
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 6),
                  child: RaisedButton(
                    onPressed: () {
                      controller.listarProdutos();
                    },
                    color: Theme.of(context).accentColor,
                    child: Icon(Icons.home),
                  ),
                )
              ],
            ),
            Observer(
              builder: (_) {
                if (controller.botoes == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: GridView.count(
                    //shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio:
                    MediaQuery.of(context).size.aspectRatio * 2,
                    children: controller.botoes,
                    padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
