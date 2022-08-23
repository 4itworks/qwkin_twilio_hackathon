import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_list_tile/customer_list_tile.widget.dart';
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
  void initState() {
    super.initState();

    store.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) => SmartRefresher(
    controller: store.refreshController,
    onRefresh: store.onRefresh,
    child: SingleChildScrollView(
          child: Center(
            child: Observer(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Chart(
                      rates: store.rates,
                    ).marginOnly(bottom: .3),
                    Column(
                      children: List.generate(store.rates.length, (index) {
                        return CustomerListTile(
                          rate: store.rates[index],
                        );
                      }),
                    )
                  ],
                );
              },
            ),
          ),
        ),
  );
}