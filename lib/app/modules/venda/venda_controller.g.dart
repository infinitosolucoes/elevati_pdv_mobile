// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VendaController on _VendaControllerBase, Store {
  final _$quantidadeProdutosAtom =
      Atom(name: '_VendaControllerBase.quantidadeProdutos');

  @override
  int get quantidadeProdutos {
    _$quantidadeProdutosAtom.context
        .enforceReadPolicy(_$quantidadeProdutosAtom);
    _$quantidadeProdutosAtom.reportObserved();
    return super.quantidadeProdutos;
  }

  @override
  set quantidadeProdutos(int value) {
    _$quantidadeProdutosAtom.context.conditionallyRunInAction(() {
      super.quantidadeProdutos = value;
      _$quantidadeProdutosAtom.reportChanged();
    }, _$quantidadeProdutosAtom, name: '${_$quantidadeProdutosAtom.name}_set');
  }

  final _$totalCompraAtom = Atom(name: '_VendaControllerBase.totalCompra');

  @override
  double get totalCompra {
    _$totalCompraAtom.context.enforceReadPolicy(_$totalCompraAtom);
    _$totalCompraAtom.reportObserved();
    return super.totalCompra;
  }

  @override
  set totalCompra(double value) {
    _$totalCompraAtom.context.conditionallyRunInAction(() {
      super.totalCompra = value;
      _$totalCompraAtom.reportChanged();
    }, _$totalCompraAtom, name: '${_$totalCompraAtom.name}_set');
  }

  final _$indiceAtom = Atom(name: '_VendaControllerBase.indice');

  @override
  List<dynamic> get indice {
    _$indiceAtom.context.enforceReadPolicy(_$indiceAtom);
    _$indiceAtom.reportObserved();
    return super.indice;
  }

  @override
  set indice(List<dynamic> value) {
    _$indiceAtom.context.conditionallyRunInAction(() {
      super.indice = value;
      _$indiceAtom.reportChanged();
    }, _$indiceAtom, name: '${_$indiceAtom.name}_set');
  }

  final _$botoesAtom = Atom(name: '_VendaControllerBase.botoes');

  @override
  List<Widget> get botoes {
    _$botoesAtom.context.enforceReadPolicy(_$botoesAtom);
    _$botoesAtom.reportObserved();
    return super.botoes;
  }

  @override
  set botoes(List<Widget> value) {
    _$botoesAtom.context.conditionallyRunInAction(() {
      super.botoes = value;
      _$botoesAtom.reportChanged();
    }, _$botoesAtom, name: '${_$botoesAtom.name}_set');
  }

  final _$carrinhoPageAtom = Atom(name: '_VendaControllerBase.carrinhoPage');

  @override
  List<Widget> get carrinhoPage {
    _$carrinhoPageAtom.context.enforceReadPolicy(_$carrinhoPageAtom);
    _$carrinhoPageAtom.reportObserved();
    return super.carrinhoPage;
  }

  @override
  set carrinhoPage(List<Widget> value) {
    _$carrinhoPageAtom.context.conditionallyRunInAction(() {
      super.carrinhoPage = value;
      _$carrinhoPageAtom.reportChanged();
    }, _$carrinhoPageAtom, name: '${_$carrinhoPageAtom.name}_set');
  }

  final _$carrinhoAtom = Atom(name: '_VendaControllerBase.carrinho');

  @override
  List<VendaProduto> get carrinho {
    _$carrinhoAtom.context.enforceReadPolicy(_$carrinhoAtom);
    _$carrinhoAtom.reportObserved();
    return super.carrinho;
  }

  @override
  set carrinho(List<VendaProduto> value) {
    _$carrinhoAtom.context.conditionallyRunInAction(() {
      super.carrinho = value;
      _$carrinhoAtom.reportChanged();
    }, _$carrinhoAtom, name: '${_$carrinhoAtom.name}_set');
  }

  final _$vendaIdAtom = Atom(name: '_VendaControllerBase.vendaId');

  @override
  int get vendaId {
    _$vendaIdAtom.context.enforceReadPolicy(_$vendaIdAtom);
    _$vendaIdAtom.reportObserved();
    return super.vendaId;
  }

  @override
  set vendaId(int value) {
    _$vendaIdAtom.context.conditionallyRunInAction(() {
      super.vendaId = value;
      _$vendaIdAtom.reportChanged();
    }, _$vendaIdAtom, name: '${_$vendaIdAtom.name}_set');
  }

  final _$venderProdutoAsyncAction = AsyncAction('venderProduto');

  @override
  Future<void> venderProduto({int produto}) {
    return _$venderProdutoAsyncAction
        .run(() => super.venderProduto(produto: produto));
  }

  final _$abrirVendaProdutoAsyncAction = AsyncAction('abrirVendaProduto');

  @override
  Future<void> abrirVendaProduto({int produto}) {
    return _$abrirVendaProdutoAsyncAction
        .run(() => super.abrirVendaProduto(produto: produto));
  }

  final _$listarProdutosAsyncAction = AsyncAction('listarProdutos');

  @override
  Future<void> listarProdutos({int produto, bool voltar = false}) {
    return _$listarProdutosAsyncAction
        .run(() => super.listarProdutos(produto: produto, voltar: voltar));
  }

  final _$_VendaControllerBaseActionController =
      ActionController(name: '_VendaControllerBase');

  @override
  void setQuantidadeProdutos(int valor) {
    final _$actionInfo = _$_VendaControllerBaseActionController.startAction();
    try {
      return super.setQuantidadeProdutos(valor);
    } finally {
      _$_VendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalCompra(double valor) {
    final _$actionInfo = _$_VendaControllerBaseActionController.startAction();
    try {
      return super.setTotalCompra(valor);
    } finally {
      _$_VendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBotoes(List<Widget> value) {
    final _$actionInfo = _$_VendaControllerBaseActionController.startAction();
    try {
      return super.setBotoes(value);
    } finally {
      _$_VendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quantidadeProdutos: ${quantidadeProdutos.toString()},totalCompra: ${totalCompra.toString()},indice: ${indice.toString()},botoes: ${botoes.toString()},carrinhoPage: ${carrinhoPage.toString()},carrinho: ${carrinho.toString()},vendaId: ${vendaId.toString()}';
    return '{$string}';
  }
}
