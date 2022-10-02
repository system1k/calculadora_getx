import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculator_getx/widgets/widgets.dart';
import 'package:calculator_getx/controllers/calculator_controller.dart';

class MathResults extends StatelessWidget {
  const MathResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final calculatorCtrl = Get.find<CalculatorController>();

    return Obx(
      () => Column(
        children: [
          SubResult( text: '${calculatorCtrl.firtsNumber}' ),
          SubResult( text: '${calculatorCtrl.mathOperator}' ),
          SubResult( text: '${calculatorCtrl.secondNumber}' ),
          const LineSeparator(),
          MainResultText( text: '${calculatorCtrl.result}' )
        ],
      ),
    );
  }
}