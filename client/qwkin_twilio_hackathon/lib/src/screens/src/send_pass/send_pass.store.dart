import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qwkin_twilio_hackathon/src/usecases/usecases.dart';

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

  @observable
  var isSendingPass = false;

  @action
  Future<bool> sendPass() async {
    isSendingPass = true;

    try {
      await sendPassUseCase(
        phoneNumber: phoneController.text,
        unitNumber: unitController.text,
        condoName: condominiumController.text,
        guestName: guestController.text,
      );
      isSendingPass = false;
      return true;
    } catch (error) {
      debugPrint(error.toString());
    }

    isSendingPass = false;
    return false;
  }
}
