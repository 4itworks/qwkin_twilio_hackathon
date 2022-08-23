import 'package:flutter/material.dart' hide Title;
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/standard_text_field/standard_text_field.widget.dart';

import '../../widgets.dart';

typedef ExpansionCallback = void Function(int index, bool isExpanded);

class Filter extends StatelessWidget {
  final ExpansionCallback expansionCallback;
  final bool isExpanded;
  final TextEditingController? phoneController;
  final TextEditingController? guestNameController;
  final TextEditingController? unitNumberController;
  final TextEditingController? condominiumController;

  const Filter({
    Key? key,
    required this.expansionCallback,
    required this.isExpanded,
    this.phoneController,
    this.guestNameController,
    this.unitNumberController,
    this.condominiumController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: expansionCallback,
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Title('Filters'),
            );
          },
          body: Column(
            children: [
              StandardTextField(
                labelText: 'Phone Number',
                textEditingController: phoneController,
              ).marginSymmetric(vertical: 5),
              StandardTextField(
                labelText: 'Guest Name',
                textEditingController: guestNameController,
              ).marginSymmetric(vertical: 5),
              StandardTextField(
                labelText: 'Unit Number',
                textEditingController: unitNumberController,
              ).marginSymmetric(vertical: 5),
              StandardTextField(
                labelText: 'Condominium',
                textEditingController: condominiumController,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ).marginSymmetric(vertical: 10),
            ],
          ).marginSymmetric(horizontal: 15),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
