import 'package:flutter/material.dart';
import 'widgets/dashbord_view_body.dart';

class DashbordView extends StatelessWidget {
  const DashbordView({super.key});
  static const String routeName = 'dashbordView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashbordViewBody(),
    );
  }
}
