import 'package:flutter/material.dart';

import 'package:qwkin_twilio_hackathon/src/models/models.dart';

Future<List<Rate>> fetchRatesUseCase() async {
  try {
    return [
      Rate(
        name: 'João Carlos',
        condoName: 'São Gabriel',
        gateName: 'FrontGate',
        comments: "Let's Go!",
        score: 5,
        staffName: 'Bruno Santos',
        unitNumber: '1505',
      ),

      Rate(
        name: 'Bruno Santos',
        condoName: 'São Gabriel',
        gateName: 'FrontGate',
        comments: "Let's Go!",
        score: 5,
        staffName: 'Bruno Santos',
        unitNumber: '1505',
      ),
      Rate(
        name: 'Alian',
        condoName: 'Riverfront',
        gateName: 'back gate',
        comments: "Wow",
        score: 2,
        staffName: 'Bruno Santos',
        unitNumber: '12',
      )
    ];
  } catch (error) {
    debugPrint(error.toString());
  }

  return [];
}
