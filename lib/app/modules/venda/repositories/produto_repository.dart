import 'package:dio/dio.dart';
import 'package:elevatipdvmobile/app/modules/venda/models/produto_model.dart';
import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';
import 'package:elevatipdvmobile/app/shared/db/db_repository.dart';

class ProdutoRepository extends DbRepository {

  Future<bool> atualizaTabela() async {
    var url = "http://54.233.230.74:8080/VeloService/listarProduto";
    Response response = await Dio().get(url);
    var lista = response.data as List;
    if(lista != null){
      await deleteAll();
    }

    for (var item in lista) {
     await save(Produto.fromMap(item));
    }
    return true;
  }

  Future<List<Produto>> findAllByProduto(String produto) async {
    var dbClient = await db;

    var list = await dbClient.rawQuery('select * from produtos where produto =? ',[produto]);

    return list.map<Produto>((json) => fromJson(json)).toList();
  }

  Future<List<Produto>> findAllByProdutoGrupoId(int produtoGrupoId) async {
    var dbClient = await db;
    print('select * from Produtos where produtoGrupoId =$produtoGrupoId ');
    var list = await dbClient.rawQuery('select * from Produtos where produtoGrupoId =? ',[produtoGrupoId]);

    return list.map<Produto>((json) => fromJson(json)).toList();
  }

  @override
  Produto fromJson(Map<String, dynamic> map) {
    return Produto.fromMap(map);
  }

  @override
  // TODO: implement tableName
  String get tableName => "Produtos";

}

