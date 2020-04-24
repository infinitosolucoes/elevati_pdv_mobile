import 'package:elevatipdvmobile/app/modules/splash/splash_controller.dart';
import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_grupo_repository.dart';
import 'package:elevatipdvmobile/app/modules/venda/repositories/produto_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:elevatipdvmobile/app/modules/splash/splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => ProdutoRepository()),
        Bind((i) => ProdutoGrupoRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
