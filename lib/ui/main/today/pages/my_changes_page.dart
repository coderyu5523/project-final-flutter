import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/style.dart';
import 'package:project_app/ui/main/today/widgets/physical_chart_scroll_view.dart';

import '../../../../data/models/chartDummy.dart';

class MyChangesPage extends StatefulWidget {
  const MyChangesPage({super.key});

  @override
  State<MyChangesPage> createState() => _MyChangesPageState();
}

class _MyChangesPageState extends State<MyChangesPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나의 변화", style: h6(),),
      ),
      body: Column(
        children: [
          _buildTabbar(),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Expanded _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          PhysicalChartScrollView(
            chartData: fatData,
            dataName: "체지방",
            dataValue: 14.2,
            chartColor: Colors.red,
          ),
          PhysicalChartScrollView(
            chartData: muscleData,
            dataName: "골격근",
            dataValue: 35.6,
            chartColor: Colors.blue,
          ),
          PhysicalChartScrollView(
            chartData: fatData,
            dataName: "체중",
            dataValue: 76.7,
            chartColor: Colors.green,
          ),
        ],
      ),
    );
  }

  TabBar _buildTabbar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(child: Text("체지방")),
        Tab(child: Text("골격근")),
        Tab(child: Text("체중")),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }
}
