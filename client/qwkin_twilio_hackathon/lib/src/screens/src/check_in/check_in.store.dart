import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwkin_twilio_hackathon/src/models/models.dart';
import 'package:qwkin_twilio_hackathon/src/usecases/src/fetch_passes.usecase.dart';
import 'package:qwkin_twilio_hackathon/src/usecases/usecases.dart';

part 'check_in.store.g.dart';

// ignore: library_private_types_in_public_api
class CheckInStore = _CheckInStore with _$CheckInStore;

abstract class _CheckInStore with Store {
  @observable
  var isFetchingPasses = false;

  @observable
  var passes = <Pass>[];

  @observable
  var refreshController = RefreshController(initialRefresh: false);


  @action
  Future<bool> checkIn() async {
    try {
      await checkInUseCase();
      return true;
    } catch (error) {
      debugPrint(error.toString());
    }

    return false;
  }

  @action
  Future<void> onRefresh() async{
    await fetchPasses();
    refreshController.refreshCompleted();
  }

  Future<void> fetchPasses() async {
    isFetchingPasses = true;
    passes = await fetchPassesUseCase();
    isFetchingPasses = false;
  }
}
