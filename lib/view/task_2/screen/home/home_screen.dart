import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'componects/animator_design.dart';
import 'componects/todo_text.dart';

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
            animatorDesign(),
            todoText(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/product');
              },
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, spreadRadius: 1, blurRadius: 5)
                  ],
                ),
                child: Hero(
                  tag: 'background',
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.grey, width: 0.8),
                              ),
                              child: const Icon(
                                Icons.alarm,
                                color: Color(0xffE77169),
                              ),
                            ),
                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Material(
                          child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 230,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff429BF1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
