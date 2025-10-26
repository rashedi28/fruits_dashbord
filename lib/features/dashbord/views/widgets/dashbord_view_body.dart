import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../add_product/presentation/views/add_product_view.dart';

class DashbordViewBody extends StatelessWidget {
  const DashbordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: 'إضافة منتج',
          )
        ],
      ),
    );
  }
}
