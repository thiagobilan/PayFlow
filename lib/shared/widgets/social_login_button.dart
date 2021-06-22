import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(BorderSide(color: AppColors.stroke)),
        ),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset(AppImages.google)),
            VerticalDivider(
              color: AppColors.stroke,
            ),
            Expanded(flex: 4, child: Center(child: Text('Entrar com Google'))),
          ],
        ),
      ),
    );
  }
}
