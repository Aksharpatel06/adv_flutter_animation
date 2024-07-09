import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE77169),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'TODO',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Hello, John.',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              'This is a daily quote.',
              style: GoogleFonts.montserrat(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'You have 10 tasks to do today.',
              style: GoogleFonts.montserrat(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey,width: 0.8),
                          ),
                          child: Icon(Icons.alarm,color:Color(0xffE77169),),
                        ),
                        Icon(Icons.more_vert,color: Colors.grey,)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
