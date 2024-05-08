import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String title;
  bool isPassword;
  final double height;
  final bool isSuffixIconShown;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final String? Function(String?)? validator;

  final TextEditingController controller;

  final IconData? pIcon;

  CustomTextFormField(
      {super.key,
      this.maxLines = 1,
      required this.title,
      this.isPassword = false,
      this.isSuffixIconShown = false,
      this.keyboardType,
      required this.validator,
      required this.controller,
      this.pIcon,
      this.readOnly = false,
      this.height = 35});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.style17,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height,
                child: TextFormField(
                  readOnly: readOnly,
                  maxLines: maxLines,
                  controller: controller,
                  validator: validator,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
       else{
         print('x');
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.style17,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height,
                child: TextFormField(
                  readOnly: readOnly,
                  maxLines: maxLines,
                  controller: controller,
                  validator: validator,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
