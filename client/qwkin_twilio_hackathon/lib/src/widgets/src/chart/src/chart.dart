import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:qwkin_twilio_hackathon/src/models/models.dart';

class Chart extends StatefulWidget {
  final List<Rate> rates;

  const Chart({
    Key? key,
    required this.rates,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 80,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ChartRate> getChartRates() {
    final chartRates = <ChartRate>[
      ChartRate(
        rate: 1,
        rateQuantity: 0,
      ),
      ChartRate(
        rate: 2,
        rateQuantity: 0,
      ),
      ChartRate(
        rate: 3,
        rateQuantity: 0,
      ),
      ChartRate(
        rate: 4,
        rateQuantity: 0,
      ),
      ChartRate(
        rate: 5,
        rateQuantity: 0,
      )
    ];

    for (int i = 0; i < widget.rates.length; i++) {
      final rate = widget.rates[i];

      final selectedRate =
          chartRates.where((chart) => chart.rate == rate.score).first;
      chartRates.removeWhere((chart) => chart.rate == rate.score);
      selectedRate.rateQuantity += 1;
      chartRates.add(selectedRate);
    }

    return chartRates;
  }

  showingSections() {
    final listOfRates = getChartRates();

    return List.generate(listOfRates.length, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.orange,
            value: listOfRates[i].rateQuantity.toDouble(),
            title: listOfRates[i].rate.toString(),
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            title: listOfRates[i].rate.toString(),
            value: listOfRates[i].rateQuantity.toDouble(),
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            title: listOfRates[i].rate.toString(),
            value: listOfRates[i].rateQuantity.toDouble(),
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.blue,
            value: listOfRates[i].rateQuantity.toDouble(),
            title: listOfRates[i].rate.toString(),
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.red,
            value: listOfRates[i].rateQuantity.toDouble(),
            title: listOfRates[i].rate.toString(),
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}

class ChartRate {
  final int rate;
  int rateQuantity;

  ChartRate({
    required this.rateQuantity,
    required this.rate,
  });
}
