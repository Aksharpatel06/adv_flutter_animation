import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/global_variable.dart';

Column previousData({required String name, int? num}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          'Previous-$name',
          style: GoogleFonts.montserrat(color: Colors.grey.shade500),
        ),
      ),
      ...List.generate(
        titleList.length,
            (index) => previousListTile(index,num: num),
      )
    ],
  );
}

ListTile previousListTile(int index, {int? num}) {
  return ListTile(
    leading: Icon(
      (index == num) ? Icons.check_box_outline_blank : Icons.check_box,
      color: (index == num) ? Colors.grey.shade700 : const Color(0xffE77169),
    ),
    title: Text(
      titleList[index],
      style: GoogleFonts.montserrat(color: Colors.grey.shade700),
    ),
    trailing: Icon(
      Icons.alarm,
      color: Colors.grey.shade700,
    ),
  );
}