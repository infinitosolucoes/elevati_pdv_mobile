import 'package:elevatipdvmobile/app/app_controller.dart';
import 'package:elevatipdvmobile/app/modules/splash/splash_module.dart';
import 'package:elevatipdvmobile/app/modules/venda/venda_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:elevatipdvmobile/app/app_widget.dart';
import 'package:elevatipdvmobile/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
      Router(Modular.initialRoute, module: SplashModule()),
      Router('/venda', module: VendaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
