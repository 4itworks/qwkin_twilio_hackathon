import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_list_tile/customer_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/filter/filter.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

import 'home.store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final store = HomeStore();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Observer(
            builder: (BuildContext context) {
              return Column(
                children: [
                  Filter(
                    isExpanded: store.isFilterExpanded,
                    expansionCallback: store.toggleFilterExpansionPanel,
                    guestNameController: store.guestNameController,
                    condominiumController: store.condominiumNameController,
                    phoneController: store.phoneNameController,
                    unitNumberController: store.unitNumberNameController,
                  ).marginOnly(
                    top: 7.5,
                    bottom: 7.5,
                  ),
                  const Chart().marginOnly(bottom: .3),
                  Column(
                    children: List.generate(7, (index) {
                      return CustomerListTile();
                    }),
                  )
                ],
              );
            },
          ),
        ),
      );
}
