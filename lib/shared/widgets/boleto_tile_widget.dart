import 'package:flutter/material.dart';

import 'package:payflow/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  BoletoTileWidget({
    Key? key,
    required this.boleto,
  }) : super(key: key);
  final BoletoModel boleto;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        boleto.name!,
        style: TextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${boleto.dueDate}",
        style: TextStyles.captionBody,
      ),
      trailing: Text.rich(
        TextSpan(
          style: TextStyles.trailingRegular,
          text: "R\$",
          children: [
            TextSpan(
                text: "${boleto.value!.toStringAsFixed(2)}",
                style: TextStyles.trailingBold)
          ],
        ),
      ),
    );
  }
}
