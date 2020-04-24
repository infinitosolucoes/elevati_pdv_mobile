import 'package:mobx/mobx.dart';

part 'vender_controller.g.dart';

class VenderController = _VenderControllerBase with _$VenderController;

abstract class _VenderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void teste() {
    value++;
  }
}
