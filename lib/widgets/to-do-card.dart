import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class card extends StatelessWidget {
  String varTiltle;
  bool varStatus;
  Function changeStatus;
  Function deleteTask;
  int i;
  card({
    super.key,
    required this.varTiltle,
    required this.changeStatus,
    required this.varStatus,
    required this.deleteTask,
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
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTiltle,
                style: TextStyle(
                  color: varStatus ? Colors.black : Colors.white,
                  fontSize: 22,
                  decoration: varStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    varStatus ? Icons.check : Icons.close,
                    size: 27,
                    color: varStatus ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      deleteTask(i);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: const Color.fromARGB(255, 248, 96, 85),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
