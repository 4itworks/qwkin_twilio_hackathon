import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'send_pass.store.g.dart';

// ignore: library_private_types_in_public_api
class SendPassStore = _SendPassStore with _$SendPassStore;

abstract class _SendPassStore with Store {
  @observable
  var phoneController = TextEditingController();

  @observable
  var guestController = TextEditingController();

  @observable
  var unitController = TextEditingController();

  @observable
  var condominiumController = TextEditingController();

  @action
  void toggleFilterExpansionPanel(_, bool isExpanded) {

  }
}
