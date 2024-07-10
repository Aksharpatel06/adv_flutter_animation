import 'package:flutter/material.dart';

Container animatorDesign() {
  return Container(
    height: 55,
    width: 55,
    alignment: Alignment.topLeft,
    decoration:
    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
      BoxShadow(
        color: Colors.black12,
      )
    ]),
    child: Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    ),
  );
}
