import 'package:get/get.dart';

class CalculatorController extends GetxController {

  var firtsNumber  = '10'.obs;
  var mathOperator = '+'.obs;
  var secondNumber = '20'.obs;
  var result       = '30'.obs;

  void resetAll() {
    firtsNumber.value = '0';
    mathOperator.value = '+';
    secondNumber.value = '0';
    result.value = '0';
  }

  void changeNegPos() {

    if(result.startsWith('-')) {
      result.value = result.value.replaceAll( '-', '');
    } else {
      result.value = '-${result.value}';
    }

  }

  addNumber(String number) {

    if(result.value == '0') {
      return result.value = number;
    }

    if(result.value == '-0') {
      return result.value = '-$number';
    }

    result.value = result.value + number;      
  }

  void addDecimalPoint(){
    if(result.contains('.')) return;

    if(result.startsWith('0')) {
      result.value = '0.';
    } else {
      result.value = '${result.value}.';
    }
  }

  void selectOperation(String newOperation) {
    mathOperator.value = newOperation;
    firtsNumber.value = result.value;
    result.value = '0';
  }

  void deleteLastEntry() {

    if(result.value.replaceAll('-', '').length > 1) {
      result.value = result.value.substring(0, result.value.length - 1);
    } else {
      result.value = '0';
    }

  }

  calculateResult(){
    double num1 = double.parse(firtsNumber.value); 
    double num2 = double.parse(result.value);
    secondNumber.value = result.value;

    switch(mathOperator.value){

      case '+':
        result.value = '${num1 + num2}';
      break;

      case '-':
        result.value = '${num1 - num2}';
      break;

      case '/':
        result.value = '${num1 / num2}';
      break;

      case 'X':
        result.value = '${num1 * num2}';
      break;

      default:
        return;
    }

    if(result.endsWith('.0')) {
      result.value = result.value.substring(0, result.value.length - 2);
    }
  }
    
}