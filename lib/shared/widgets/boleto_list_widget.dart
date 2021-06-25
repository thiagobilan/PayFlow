import 'package:flutter/material.dart';
import 'package:payflow/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  BoletoListWidget({Key? key}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: controller.boletoNotifier,
      builder: (context, boletos, child) => ListView.builder(
        itemCount: boletos.length,
        itemBuilder: (context, index) {
          return BoletoTileWidget(
            boleto: boletos[index],
          );
        },
      ),
    );
  }
}
