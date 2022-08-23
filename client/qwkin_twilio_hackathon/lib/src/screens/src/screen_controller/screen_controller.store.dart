import 'package:mobx/mobx.dart';

part 'screen_controller.store.g.dart';

// ignore: library_private_types_in_public_api
class ScreenControllerStore = _ScreenControllerStore
    with _$ScreenControllerStore;

abstract class _ScreenControllerStore with Store {}
