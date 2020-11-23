import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
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
      child: Observer(
        builder: (context) {
          final state = controller.chartState;
          if (state is ChartState) {
            return Column(
              children: [
                IgnorePointer(
                  child: Container(
                    height: 200,
                    child: SimpleLineChart(state.values, endMargin: 48),
                  ),
                ),
                SizedBox(height: kMarginSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ChartType.values
                      .map((type) => _ChartTypeButton(
                            type: type,
                            isSelected: type == state.type,
                            onClick: () => controller.onChartTypeClicked(type),
                          ))
                      .toList(),
                ),
                SizedBox(height: kMarginDefault),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _ChartTypeButton extends StatelessWidget {
  final ChartType type;
  final bool isSelected;
  final VoidCallback onClick;

  const _ChartTypeButton({
    @required this.type,
    @required this.isSelected,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : null,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kMarginDetail,
            horizontal: kMarginSmall,
          ),
          child: Text(
            AppStrings.chartTypeText(type),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleLineChart extends StatelessWidget {
  final List<int> values;
  final int endMargin;

  SimpleLineChart(this.values, {this.endMargin = 0});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      _createChartData(values),
      animate: true,
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(endMargin),
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
