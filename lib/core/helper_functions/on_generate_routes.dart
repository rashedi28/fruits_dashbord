import 'package:flutter/material.dart';

import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/dashbord/views/dashbord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashbordView.routeName:
      return MaterialPageRoute(builder: (context) => const DashbordView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
