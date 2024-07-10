import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'componects/previous_data.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Hero(
            tag: 'box',
            child: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'box',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 0.8),
                        ),
                        child: const Icon(
                          Icons.alarm,
                          color: Color(0xffE77169),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' 8 Tasks',
                        style: GoogleFonts.montserrat(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Custom',
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 300,
                            child: LinearProgressIndicator(
                              value: 0.8,
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.pink.shade100,
                              color: const Color(0xffE77169),
                              minHeight: 5,
                            ),
                          ),
                          Text(
                            '88 %',
                            style: GoogleFonts.montserrat(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            previousData(name: 'Thu'),
            previousData(name: 'Fri', num: 3),
          ],
        ),
      ),
    );
  }
}
