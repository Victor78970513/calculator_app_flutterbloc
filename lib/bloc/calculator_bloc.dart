import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<ResetAC>(_resetAc);
    on<AddNumber>(_addNumber);
    on<AddOperation>(_addOperation);
    on<DeleteLastChar>(_deleteLastChar);
    on<FinalMathResult>(_finalMathResult);
  }

  _deleteLastChar(DeleteLastChar event, Emitter<CalculatorState> emit) {
    if (state.mathResult != '0' && state.mathResult.isNotEmpty) {
      final newMathResult =
          state.mathResult.substring(0, state.mathResult.length - 1);
      emit(state.copyWith(mathResult: newMathResult));
    }
  }

  _resetAc(ResetAC event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(mathResult: '0'));
  }

  _addNumber(AddNumber event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
        mathResult: state.mathResult == '0'
            ? event.number
            : state.mathResult + event.number));
  }

  _addOperation(AddOperation event, Emitter<CalculatorState> emit) {
    if (state.mathResult.isNotEmpty && state.mathResult != '0') {
      final lastChar = state.mathResult
          .substring(state.mathResult.length - 1, state.mathResult.length);
      final containOpe = ['/', 'x', '+', '-', '%'].contains(lastChar);
      if (!containOpe) {
        emit(state.copyWith(mathResult: state.mathResult + event.operation));
      }
    }
  }

  _finalMathResult(FinalMathResult event, Emitter<CalculatorState> emit) {
    final parser = Parser();
    final expr = parser
        .parse(state.mathResult.replaceAll('x', '*').replaceAll(',', '.'));
    final result = expr.evaluate(EvaluationType.REAL, ContextModel());
    if (result % 1 == 0) {
      emit(state.copyWith(
        rawOperation: state.mathResult,
        mathResult: result.toStringAsFixed(0),
      ));
    } else {
      emit(state.copyWith(
        rawOperation: state.mathResult,
        mathResult: result.toStringAsFixed(2),
      ));
    }
  }
}
