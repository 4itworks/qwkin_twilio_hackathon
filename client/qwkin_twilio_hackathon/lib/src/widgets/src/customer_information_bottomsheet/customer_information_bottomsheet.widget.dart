import 'package:flutter/material.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_information_bottomsheet/customer_information_list_tile.widget.dart';

import '../../../models/models.dart';

class CustomerInformationBottomSheet extends StatelessWidget {
  final Rate rate;

  const CustomerInformationBottomSheet({
    Key? key,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: const Text(
              'Customer Information',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).marginOnly(bottom: 15),
          Expanded(
            child: ListView(
              children: [
                CustomerInformationListTile(
                  title: 'Customer',
                  description: rate.name!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Unit Number',
                  description: rate.unitNumber!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Condominium',
                  description: rate.condoName!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Staff',
                  description: rate.staffName!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Gate',
                  description: rate.gateName!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Score',
                  description: rate.score.toString(),
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Comments',
                  description:
                  rate.comments!,
                ).marginSymmetric(vertical: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
