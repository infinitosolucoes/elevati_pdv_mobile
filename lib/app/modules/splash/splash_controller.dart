import 'dart:io';

import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_grupo_repository.dart';
import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_repository.dart';
import 'package:elevatipdvmobile/app/shared/db/db_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  var  _produtoRepository = Modular.get<ProdutoRepository>();
  var _produtoGrupoRepository = Modular.get<
      ProdutoGrupoRepository>();

  Future<bool> loadProdutoFromApi() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return await _produtoRepository.atualizaTabela();
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }

  Future<bool> carregaDB() async{
   await DbHelper.getInstance().db;
   return true;
  }

  Future<bool> loadProdutoGrupoFromApi() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _produtoGrupoRepository.atualizaTabela();
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
