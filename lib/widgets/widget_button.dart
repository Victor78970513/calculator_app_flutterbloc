import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const OperationButton({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 60,
            width: 70,
            margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            decoration: const BoxDecoration(
                color: Color(0xffF44E40), shape: BoxShape.circle),
            child: Align(
                alignment: Alignment.center,
                child: Text(text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 25)))));
  }
}

class ResultButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function() onTap;
  final double? tamano;

  const ResultButton(
      {super.key,
      required this.text,
      this.color = const Color(0xffF4796A),
      required this.onTap,
      this.tamano = 20.0});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 55,
            width: 70,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            child: Align(
                alignment: Alignment.center,
                child: Text(text,
                    style: TextStyle(
                        color:
                            color == Colors.white ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: tamano)))));
  }
}
