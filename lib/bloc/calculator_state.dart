part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResult;
  final String rawOperation;
  final String number;
  final String operation;

  const CalculatorState(
      {this.operation = '',
      this.number = '',
      this.mathResult = '0',
      this.rawOperation = ''});

  CalculatorState copyWith(
          {String? mathResult,
          String? number,
          String? operation,
          String? rawOperation}) =>
      CalculatorState(
          mathResult: mathResult ?? this.mathResult,
          number: number ?? this.number,
          operation: operation ?? this.operation,
          rawOperation: rawOperation ?? this.rawOperation);
}
