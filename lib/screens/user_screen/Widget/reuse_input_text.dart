
import 'package:flutter/material.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

class TextFieldInput extends StatelessWidget {
  final String? text;
  final Widget? prefixIcon;
  final IconData? iconData;
  final String? imagePath;
  final VoidCallback? onTap;
  TextEditingController? controller = TextEditingController();
   TextFieldInput({super.key,this.controller,this.prefixIcon,this.text,this.imagePath,this.onTap,this.iconData});

  @override
  Widget build(BuildContext context) {
    PrimaryColors colors = PrimaryColors();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: iconData != null ?  Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(iconData,color: colors.orange800,),
          ):CustomImageView(
            margin: const EdgeInsets.only(right: 20),
            width: 5,
            height: 5,
            imagePath: imagePath,
            color: colors.orange800,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 18,left: 15),
            child: InkWell(
              onTap: onTap,
                child: Text(text!,  style: theme.textTheme.displaySmall?.copyWith(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),)),
          ),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: colors.orange800), // Change the color to your desired color
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Change the color to your desired color
          ),
        ),
        ),
    );
  }
}
