import 'package:cenima/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Expanded(
                flex: 8,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 245,
                        width: double.infinity,
                        child: Image.asset(
                            "asset/images/photo_2024-07-02_15-05-02-removebg-preview.png"),
                      ),
                      const Text(
                        'Stream & Chill',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[800]),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Discover movies you will love, just for you.',
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 25,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'This app provides detailed information about upcoming movies, including release dates, synopses, cast and crew, and images',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[100],
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(""),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
