import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_variable.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9891F),
        centerTitle: true,
        title: Text(
          'Matching game',
          style: GoogleFonts.overpass(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    4,
                    (index) => Row(
                      children: [
                        SizedBox(
                            height: 110,
                            child: Image.asset(
                              frontImage[index],
                              fit: BoxFit.cover,
                            )),
                        Draggable(
                          data: index,
                          feedback: Container(
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              shape: BoxShape.circle,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    4,
                    (index) => Row(
                      children: [
                        DragTarget(
                          onAcceptWithDetails: (details) {
                            if (wrongAnswer > 0 && details.data == index) {
                              colorList[index] = Colors.blue.shade100;
                            } else if (wrongAnswer > 0 &&
                                details.data != index) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Try again!'),
                                    content:
                                        Text('Your are $wrongAnswer chance !'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Next')),
                                    ],
                                  );
                                },
                              );
                              wrongAnswer--;
                              print(index);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('SucessFully....!'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Next')),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, candidateData, rejectedData) =>
                              Container(
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            width: 50,
                            decoration: BoxDecoration(
                              color: colorList[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Image.asset(backImage[index]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Restart Games'),
                actions: [
                  TextButton(
                      onPressed: () {
                        wrongAnswer = 3;
                        Navigator.pop(context);
                      },
                      child: const Text('Yes')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('no')),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
