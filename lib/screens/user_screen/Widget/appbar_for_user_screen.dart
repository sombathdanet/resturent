import 'package:flutter/material.dart';

import '../../../../themes/theme_helper.dart';


class AppBarForUser extends StatelessWidget {
  final String text;
  const AppBarForUser({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildText(),
          ],
        ),
      ),
    );
  }
  Widget _buildText() {
    return  Text(
      text,
      style: theme.textTheme.titleMedium?.copyWith(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
    );
  }
}
