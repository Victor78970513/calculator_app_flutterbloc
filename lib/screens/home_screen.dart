import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculator_app/widgets/widgets.dart';
import 'package:calculator_app/bloc/calculator_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
      final bloc = BlocProvider.of<CalculatorBloc>(context);
      return Scaffold(
          backgroundColor: const Color(0xffDFDFDF),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BoardResult(state.mathResult, state.rawOperation),
              Column(children: [
                Row(children: [
                  Column(children: [
                    Row(children: [
                      ResultButton(
                          text: 'AC', onTap: () => bloc.add(ResetAC())),
                      const SizedBox(width: 100),
                      ResultButton(
                          text: '⌫',
                          onTap: () => bloc.add(DeleteLastChar()),
                          color: Colors.white)
                    ]),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(children: [
                          Column(children: [
                            ResultButton(
                                tamano: 30,
                                text: '1',
                                onTap: () => bloc.add(AddNumber('1')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '4',
                                onTap: () => bloc.add(AddNumber('4')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '7',
                                onTap: () => bloc.add(AddNumber('7')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '',
                                onTap: () {},
                                color: Colors.white)
                          ]),
                          Column(children: [
                            ResultButton(
                                tamano: 30,
                                text: '2',
                                onTap: () => bloc.add(AddNumber('2')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '5',
                                onTap: () => bloc.add(AddNumber('5')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '8',
                                onTap: () => bloc.add(AddNumber('8')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '0',
                                onTap: () => bloc.add(AddNumber('0')),
                                color: Colors.white)
                          ]),
                          Column(children: [
                            ResultButton(
                                tamano: 30,
                                text: '3',
                                onTap: () => bloc.add(AddNumber('3')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '6',
                                onTap: () => bloc.add(AddNumber('6')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: '9',
                                onTap: () => bloc.add(AddNumber('9')),
                                color: Colors.white),
                            ResultButton(
                                tamano: 30,
                                text: ',',
                                onTap: () => bloc.add(AddNumber(',')),
                                color: Colors.white)
                          ])
                        ]))
                  ]),
                  Column(children: [
                    OperationButton(
                        text: '%', onTap: () => bloc.add(AddOperation('%'))),
                    OperationButton(
                        text: '/', onTap: () => bloc.add(AddOperation('/'))),
                    OperationButton(
                        text: 'x', onTap: () => bloc.add(AddOperation('x'))),
                    OperationButton(
                        text: '-', onTap: () => bloc.add(AddOperation('-'))),
                    OperationButton(
                        text: '+', onTap: () => bloc.add(AddOperation('+')))
                  ])
                ]),
                Row(children: [
                  Expanded(
                      child: ResultButton(
                          tamano: 50,
                          onTap: () => bloc.add(FinalMathResult()),
                          text: '='))
                ])
              ])
            ],
          )));
    });
  }
}
