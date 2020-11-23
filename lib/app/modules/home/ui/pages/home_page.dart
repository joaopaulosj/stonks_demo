import 'package:demo_stonks/app/modules/home/ui/widgets/home_app_bar.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/home_balance_header.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/home_bottom_nav_bar.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/home_buying_power.dart';
import 'package:demo_stonks/app/modules/home/ui/widgets/home_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(),
            HomeBalanceHeader(),
            HomeChart(),
            HomeBuyingPower(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
