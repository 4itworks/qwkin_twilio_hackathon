import 'package:flutter/material.dart' hide Title;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_list_tile/customer_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/filter/filter.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_bottomsheet.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

import 'check_in.store.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  CheckInState createState() => CheckInState();
}

class CheckInState extends State<CheckIn> {
  final store = CheckInStore();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Observer(
            builder: (BuildContext context) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Title('Sent Passes (5)').marginOnly(
                      bottom: 20,
                    ),
                    Column(
                      children: List.generate(20, (index) {
                        return PassInformationListTile(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: const Color(0xFFEEEEEE),
                              builder: (BuildContext context) {
                                return PassInformationBottomSheet(
                                  isLoading: false,
                                  onCheckInPressed: () =>
                                      store.checkIn(context),
                                );
                              },
                            );
                          },
                          description: 'Teste',
                          title: 'tittle',
                        );
                      }),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
}
