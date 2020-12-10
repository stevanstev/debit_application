import 'package:debit/src/models/monthly_data.dart';
import 'package:debit/src/ui/utils/colors.dart';
import 'package:debit/src/ui/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardMonthlyUsage extends StatefulWidget {
  final List<MonthlyData> datas;

  CardMonthlyUsage({Key key, this.datas}) : super(key: key);

  @override
  _CardMonthlyUsageState createState() => _CardMonthlyUsageState(datas: datas);
}

class _CardMonthlyUsageState extends State<CardMonthlyUsage> {
  List<MonthlyData> datas;

  _CardMonthlyUsageState({this.datas});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
          text: 'Card Monthly Usage',
          textStyle: simpleStyle(color: debitBlack54)),
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <LineSeries<MonthlyData, String>>[
        LineSeries<MonthlyData, String>(
            color: debitBlue900,
            xAxisName: 'Month',
            yAxisName: 'Usages',
            enableTooltip: true,
            dataSource: datas,
            xValueMapper: (MonthlyData data, _) => data.month,
            yValueMapper: (MonthlyData data, _) => data.usage),
      ],
    );
  }
}
