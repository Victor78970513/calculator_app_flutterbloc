part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;

  AddNumber(this.number);
}

class AddOperation extends CalculatorEvent {
  final String operation;

  AddOperation(this.operation);
}

class DeleteLastChar extends CalculatorEvent {}

class FinalMathResult extends CalculatorEvent {}
