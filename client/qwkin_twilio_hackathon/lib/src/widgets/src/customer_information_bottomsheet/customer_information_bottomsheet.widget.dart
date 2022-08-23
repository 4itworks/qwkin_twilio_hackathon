import 'package:flutter/material.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_information_bottomsheet/customer_information_list_tile.widget.dart';

class CustomerInformationBottomSheet extends StatelessWidget {
  const CustomerInformationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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
                    description: 'João Carlos',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Unit Number',
                    description: '105',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Condominium',
                    description: 'São Gabriel',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Staff',
                    description: 'Alian',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Gate',
                    description: 'front gate',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Score',
                    description: 'Score',
                  ).marginSymmetric(vertical: 1),
                  CustomerInformationListTile(
                    title: 'Comments',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                  ).marginSymmetric(vertical: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
