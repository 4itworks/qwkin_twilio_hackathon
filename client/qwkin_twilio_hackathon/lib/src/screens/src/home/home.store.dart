import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwkin_twilio_hackathon/src/models/models.dart';
import 'package:qwkin_twilio_hackathon/src/usecases/src/fetch_rates.usecase.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  var isFilterExpanded = false;

  @observable
  var isFetchingCustomers = false;

  @observable
  var rates = <Rate>[];

  @observable
  var guestNameController = TextEditingController();

  @observable
  var phoneNameController = TextEditingController();

  @observable
  var unitNumberNameController = TextEditingController();

  @observable
  var condominiumNameController = TextEditingController();

  @observable
  var refreshController = RefreshController(initialRefresh: false);

  @action
  void toggleFilterExpansionPanel(_, bool isExpanded) {
    isFilterExpanded = !isFilterExpanded;
  }


  @action
  Future<void> onRefresh() async{
    await fetchCustomers();
    refreshController.refreshCompleted();
  }

  @action
  Future<void> fetchCustomers() async {
    isFetchingCustomers = true;
    rates = await fetchRatesUseCase();
    isFetchingCustomers = false;
    isFetchingCustomers = false;
  }
}
