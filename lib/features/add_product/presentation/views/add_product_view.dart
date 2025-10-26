import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/reops/images_repo/images_repo.dart';
import '../../../../core/reops/products_repo/products_repo.dart';
import '../../../../core/services/get_it_service.dart';
import '../manager/add_product_cubit/add_product_cubit.dart';
import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'addProductView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'أضافة منتج'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: AddProductViewBodyBlocBuilder(),
      ),
    );
  }
}
