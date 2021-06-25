import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'package:payflow/shared/widgets/label_button.dart';

class SetLabelButton extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecundaryColor;
  const SetLabelButton({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secundaryLabel,
    required this.secundaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecundaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: LabelButon(
                    label: primaryLabel,
                    style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                    onPressed: primaryOnPressed,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: LabelButon(
                    label: secundaryLabel,
                    style:
                        enableSecundaryColor ? TextStyles.buttonPrimary : null,
                    onPressed: secundaryOnPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
