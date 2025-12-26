import 'package:flutter/material.dart';

class Cont extends StatelessWidget {

  final int alltodo;
  final int allcompleted;
const Cont({super.key, required this.alltodo, required this.allcompleted});
  @override
  Widget build(BuildContext context) {
    return             Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "$allcompleted/$alltodo",
                style: TextStyle(color:allcompleted==alltodo?Colors.green: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            );
  }
}