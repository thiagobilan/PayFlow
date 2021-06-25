import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                }
                return Container();
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                  title: Text(
                    'Escaneie o código de barras do boleto',
                    style: TextStyles.buttonBackground,
                  ),
                  backgroundColor: Colors.black,
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black.withOpacity(.8),
                    )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        )),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: SetLabelButton(
                  primaryLabel: "Inserir código do Boleto",
                  primaryOnPressed: () {},
                  secundaryLabel: "Adicionar da Galeria",
                  secundaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: BottomSheetWidget(
                        primaryLabel: "Escanear novamente",
                        primaryOnPressed: () {
                          controller.scanWithCamera();
                        },
                        secundaryLabel: "Digitar código",
                        secundaryOnPressed: () {},
                        title:
                            "Não foi possível identificar um código de barras.",
                        subtitle:
                            "Tente escanear novamente ou digite o código do seu boleto."),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
