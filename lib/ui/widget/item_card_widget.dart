import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.red),
          height: 150,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  color: Colors.blue,
                ),
                width: 150,
              ),
              Column(
                children: [
                  Row(
                    children: [Text("ahmed")],
                  )
                ],
              )
            ],
          )),
    );
  }
}
