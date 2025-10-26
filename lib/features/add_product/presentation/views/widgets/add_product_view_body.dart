import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashbord/features/add_product/domain/entities/review_entity.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/show_bar.dart';
import 'image_field.dart';
import 'is_featured_check_box.dart';
import 'is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late int expirationMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'إسم المنتج',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'سعر المنتج',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'رمز المنتج',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'وصف المنتج',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = int.parse(value!);
                },
                hintText: 'أشهر إنتهاء الصلاحية',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
                hintText: 'عدد السعرات الحرارية',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
                hintText: 'كمية الوحدة',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (value) {
                  image = value;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ProductEntity input = ProductEntity(
                          name: name,
                          code: code,
                          description: description,
                          price: price,
                          image: image!,
                          isFeatured: isFeatured,
                          expirationMonths: expirationMonths,
                          numberOfCalories: numberOfCalories,
                          unitAmount: unitAmount,
                          isOrganic: isOrganic,
                          reviews: [
                            ReviewEntity(
                              name: 'Ahmed',
                              image: 'https://avatar.iran.liara.run/public/16',
                              rating: 5,
                              date: DateTime.now().toIso8601String(),
                              reviewDescription: 'Nice Mango',
                            ),
                          ],
                        );
                        context.read<AddProductCubit>().addProduct(input);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showBar(context, 'Please select an image');
                    }
                  },
                  text: 'إضافة منتج'),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
