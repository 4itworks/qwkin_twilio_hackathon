import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qwkin_twilio_hackathon/src/screens/screens.dart';
import 'package:qwkin_twilio_hackathon/src/usecases/usecases.dart';

part 'check_in.store.g.dart';

// ignore: library_private_types_in_public_api
class CheckInStore = _CheckInStore with _$CheckInStore;

abstract class _CheckInStore with Store {
  @observable
  var isLoadingCheckIn = false;

  @action
  Future<void> checkIn(BuildContext context) async {
    isLoadingCheckIn = true;

    try {
      final test = await checkInUseCase();
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('teste')));
      debugPrint(error.toString());
    }

    isLoadingCheckIn = false;
  }
}
