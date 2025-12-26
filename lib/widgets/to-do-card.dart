import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class card extends StatelessWidget {
  String varTiltle;
  bool varStatus;
  Function changeStatus;
  int i;
  card({
    super.key,
    required this.varTiltle,
    required this.changeStatus,
    required this.varStatus,
    required this.i,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(i);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTiltle,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Icon(
                varStatus ? Icons.check : Icons.close,
                size: 27,
                color: varStatus ? Colors.green : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
