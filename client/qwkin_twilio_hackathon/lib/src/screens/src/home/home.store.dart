import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  var isFilterExpanded = false;

  @observable
  var guestNameController = TextEditingController();

  @observable
  var phoneNameController = TextEditingController();

  @observable
  var unitNumberNameController = TextEditingController();

  @observable
  var condominiumNameController = TextEditingController();

  @action
  void toggleFilterExpansionPanel(_, bool isExpanded) {
    isFilterExpanded = !isFilterExpanded;
  }
}
