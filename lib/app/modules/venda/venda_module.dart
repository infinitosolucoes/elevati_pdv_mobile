import 'package:elevatipdvmobile/app/modules/venda/repositories/venda_produto_repository.dart';
import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_grupo_repository.dart';
import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_repository.dart';
import 'package:elevatipdvmobile/app/modules/venda/pages/vender/vender_controller.dart';
import 'package:elevatipdvmobile/app/modules/venda/pages/carrinho/carrinho_controller.dart';
import 'package:elevatipdvmobile/app/modules/venda/pages/pagamento/pagamento_controller.dart';
import 'package:elevatipdvmobile/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:elevatipdvmobile/app/modules/venda/venda_page.dart';

class VendaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VendaProdutoRepository()),
        Bind((i) => ProdutoGrupoRepository()),
        Bind((i) => ProdutoRepository()),
        Bind((i) => VenderController()),
        Bind((i) => CarrinhoController()),
        Bind((i) => PagamentoController()),
        Bind((i) => VendaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => VendaPage()),
      ];

  static Inject get to => Inject<VendaModule>.of();
}
