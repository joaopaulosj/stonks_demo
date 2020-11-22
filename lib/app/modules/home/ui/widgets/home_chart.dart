import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demo_stonks/app/modules/home/domain/models/chart_value.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        child: Observer(
          builder: (context) {
            final state = controller.chartState;

            if (state is ChartState) {
              return SimpleLineChart(_createChartData(state.values));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  List<charts.Series<ChartValue, int>> _createChartData(List<int> values) {
    List<ChartValue> getPoints() {
      var i = 0;
      final baseValue = values.first;
      return values.map((e) {
        return ChartValue(i++, e - baseValue);
      }).toList();
    }

    final color = values.last - values.first > 0
        ? charts.MaterialPalette.green.shadeDefault
        : charts.MaterialPalette.red.shadeDefault;

    return [
      charts.Series<ChartValue, int>(
        id: 'Values',
        colorFn: (_, __) => color,
        domainFn: (ChartValue chartValue, _) => chartValue.index,
        measureFn: (ChartValue chartValue, _) => chartValue.value,
        data: getPoints(),
      )..setAttribute(charts.rendererIdKey, 'customArea'),
    ];
  }
}

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;

  SimpleLineChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: true,
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(64),
        topMarginSpec: charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
      domainAxis: const charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
      customSeriesRenderers: [
        charts.LineRendererConfig(
          customRendererId: 'customArea',
          includeArea: true,
          stacked: true,
        ),
      ],
    );
  }
}
