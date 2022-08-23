import 'package:flutter/material.dart';

import 'package:qwkin_twilio_hackathon/src/models/models.dart';

Future<List<Pass>> fetchPassesUseCase() async {

  try {
    return [
      Pass(
        guestName: 'João Carlos',
        condoName: 'São Gabriel',
        phoneNumber: '+1 111 222 3333',
        unitNumber: '1505',
        id: 1,
      ),
      
      Pass(
        guestName: 'Alian',
        condoName: 'São Gabriel',
        phoneNumber: '+1 999 888 4444',
        unitNumber: '12',
        id: 2,
      )
    ];
  } catch (error) {
    debugPrint(error.toString());
  }

  return [];
}
