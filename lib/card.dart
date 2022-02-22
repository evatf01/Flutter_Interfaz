import 'package:flutter/material.dart';

class MoreDetails extends StatelessWidget {
  MoreDetails(List<int> tamanio);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            width: 50,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.lightBlue[200].withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }
}
