import 'package:flutter/material.dart' hide Title;
import 'package:qwkin_twilio_hackathon/src/models/models.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_information_bottomsheet/customer_information_bottomsheet.widget.dart';

import '../../widgets.dart';

class CustomerListTile extends StatelessWidget {
  final Rate rate;

  const CustomerListTile({
    Key? key,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: const Color(0xFFEEEEEE),
          builder: (BuildContext context) {
            return CustomerInformationBottomSheet(
              rate: rate,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  '${rate.name} (${rate.score.toString()})',
                ),
                Text('${rate.unitNumber} - ${rate.condoName}'),
                Text('by ${rate.staffName}'),
                Text('at ${rate.gateName}'),
              ],
            ),
            Image.asset('assets/arrow.png')
          ],
        ),
      ),
    );
  }
}
