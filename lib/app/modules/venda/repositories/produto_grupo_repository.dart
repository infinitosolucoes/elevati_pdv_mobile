import 'package:elevatipdvmobile/app/modules/venda/models/produto_grupo_model.dart';
import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';
import 'package:elevatipdvmobile/app/shared/db/db_repository.dart';
import 'package:dio/dio.dart';

class ProdutoGrupoRepository extends DbRepository {
  Future<bool> atualizaTabela() async {
    var dbClient = await db;
    var url = "http://54.233.230.74:8080/VeloService/listarProdutoGrupo";
    Response response = await Dio().get(url);
    var lista = response.data as List;
    if(lista != null){
      await deleteAll();
    }
    for (var item in lista) {
      await save(ProdutoGrupo.fromMap(item));
    }
    return true;
  }

  Future<List<ProdutoGrupo>> findAllByGrupo(String produtoGrupo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from ProdutoGrupos where grupo =? ',[produtoGrupo]);

    return list.map<ProdutoGrupo>((json) => fromJson(json)).toList();
  }

  Future<List<ProdutoGrupo>> findAllByGrupoPaiId(int produtoGrupoPaiId) async {
    final dbClient = await db;
    print('select * from ProdutoGrupos where produtoGrupoPaiId =$produtoGrupoPaiId ');
    final list = await dbClient.rawQuery('select * from ProdutoGrupos where produtoGrupoPaiId =? ',[produtoGrupoPaiId]);

    return list.map<ProdutoGrupo>((json) => fromJson(json)).toList();
  }

  @override
  ProdutoGrupo fromJson(Map<String, dynamic> map) {
    return ProdutoGrupo.fromMap(map);
  }

  @override
  String get tableName => "ProdutoGrupos";

}
