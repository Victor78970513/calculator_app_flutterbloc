import 'package:flutter/material.dart';

class BoardResult extends StatelessWidget {
  final String rawOperation;
  final String rawOperation2;

  const BoardResult(this.rawOperation, this.rawOperation2);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            rawOperation2,
            style: const TextStyle(fontSize: 20, color: Colors.black45),
          ),
          Text(
            rawOperation,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
