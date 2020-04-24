import 'package:elevatipdvmobile/app/modules/venda/models/venda_produto_model.dart';
import 'package:elevatipdvmobile/app/shared/db/db_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/produto_grupo_model.dart';
import 'models/produto_model.dart';
import 'repositories/produto_grupo_repository.dart';
import 'repositories/produto_repository.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {

  ProdutoRepository _produtoRepository = Modular.get<ProdutoRepository>();
  ProdutoGrupoRepository _produtoGrupoRepository = Modular.get<
      ProdutoGrupoRepository>();


  @observable
  int quantidadeProdutos = 0;

  @observable
  double totalCompra = 0;

  @observable
  List indice = [];

  @observable
  List<Widget> botoes = [];

  @observable
  List<Widget> carrinhoPage = [];

  @observable
  List<VendaProduto> carrinho = [];

  @observable
  int vendaId = 0;

  @action
  void setQuantidadeProdutos(int valor) {
    quantidadeProdutos += valor;
  }

  @action
  void setTotalCompra(double valor) {
    totalCompra += valor;
  }

  @action
  setBotoes(List<Widget> value) {
    botoes = value;
  }

  @action
  Future<void> venderProduto({int produto}) async {
    if ((carrinho.length == 0) && (quantidadeProdutos == 0) && (vendaId == 0)){
      //busca idvenda
    }
    vendaId = 1;

    Produto _prd = await _produtoRepository.findById(produto,"produtoId");
    try{
      //Salva no BD
      setQuantidadeProdutos(1);
      setTotalCompra(_prd.precoVenda);
      VendaProduto _vendaProduto = new VendaProduto(
          vendaId: vendaId,
          produtoId:_prd.produtoId,
          descricao:_prd.produto,
          quantidade:1,
          precoUnitario:_prd.precoVenda,
          valorTotal:(_prd.precoVenda*1)
      );
      carrinho.add(_vendaProduto);
      carrinhoPage.insert(0, addCarrinho(_vendaProduto.descricao, _vendaProduto.quantidade.toString() +" x " + _vendaProduto.precoUnitario.toString() + " = " + _vendaProduto.valorTotal.toString()));
    }catch (e){
      print(e.message);
    }


  }

  @action
  Future<void> abrirVendaProduto({int produto}) async {

  }

  @action
  Future<void> listarProdutos({int produto, bool voltar = false}) async {
    Map<int, String> mgrupo = new Map<int, String>();
    Map<int, String> mproduto = new Map<int, String>();
    List<Produto> prod;
    List<ProdutoGrupo> grupo;
    List<Widget> _botoes = [];

    if (voltar) {
      if (indice.length > 1) {
        indice.removeLast();
        produto = indice.last;
      } else {
        produto = null;
      }
    }

    if (produto == null) {
      botoes.clear();
      grupo = await _produtoGrupoRepository.findAllByGrupoPaiId(0);
      if(grupo.length>0) {
        grupo.forEach((item) {
          if ((item.produtoGrupoId != null) && (item.grupo != null)) {
            mgrupo.putIfAbsent(item.produtoGrupoId, () => formataNomeLista(nome:item.grupo));
          }
        });
        indice.clear();
        _botoes = montaRetorno(mgrupo, "Grupo");
      }

      prod = await _produtoRepository.findAllByProdutoGrupoId(0);
      if(grupo.length>0) {
        prod.forEach((item) {
          if ((item.produtoId != null) && (item.produtoId != null)) {
            mproduto.putIfAbsent(item.produtoId, () => formataNomeLista(nome:item.produto, valor:item.precoVenda.toString()));
          }
        });
        _botoes.addAll(montaRetorno(mproduto, "Produto"));
      }
    } else {
      prod = await _produtoRepository.findAllByProdutoGrupoId(produto);
      prod.forEach((item) {
        if ((item.produtoId != null) && (item.produtoId != null)) {
          mproduto.putIfAbsent(item.produtoId, () => formataNomeLista(nome:item.produto, valor:item.precoVenda.toString()));
        }
      });
      _botoes = montaRetorno(mproduto, "Produto");

      grupo = await _produtoGrupoRepository.findAllByGrupoPaiId(produto);
      grupo.forEach((item) {
        if ((item.produtoGrupoId != null) && (item.grupo != null)) {
          mgrupo.putIfAbsent(item.produtoGrupoId, () => formataNomeLista(nome:item.grupo));
        }
      });
      _botoes.addAll(montaRetorno(mgrupo, "Grupo"));

      if (!voltar) {
        indice.add(produto);
      }
    }

    botoes = _botoes;
  }

  String formataNomeLista({String nome, String valor}){
    if (valor == null) {
      if (nome.length > 41) {
        nome = nome.substring(0, 41) + " ...";
      }
    }else{
      if (nome.length > 36) {
        nome = "R\$ " + valor+" " + nome.substring(0, (36 - valor.length)) + " ...";
      }
      else {
        nome =  "R\$ " + valor+" " + nome + " ...";
      }

    }
    return nome;
  }

  Widget addCarrinho(String title, String subTitle){
    return ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          color: Colors.red,
          onPressed: () {

          },
        ));
  }

  List<Widget> montaRetorno(Map<int, String> lista, String tipo) {
    List<Widget> retorno = [];

    lista.forEach((id, nome) {

      switch (tipo) {
        case "Produto":
          {
            retorno.add(RaisedButton(
              onPressed: () {
                venderProduto(produto: id);
              },
              onLongPress: () {
                abrirVendaProduto(produto: id);
              },
              child: Text(nome),
              color: Color(0xffc8a9d7),
              padding: EdgeInsets.all(8),
            ));
          }
          break;
        case "Grupo":
          {
            retorno.add(RaisedButton(
              onPressed: () {
                listarProdutos(produto: id);
              },
              child: Text(nome),
              color: Color(0xff7076cb),
              padding: EdgeInsets.all(8),
            )
            );
          }
          break;
        default:
          {
            null;
          }
          break;
      }
    });
    return retorno;
  }
}
