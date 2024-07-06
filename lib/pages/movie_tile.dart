import 'dart:ffi';

import 'package:cenima/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTile extends StatelessWidget {
  final movieInfo;
  const MovieTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      movieInfo['backdrop_path'],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 60,
                  child: Text(
                    movieInfo['title'] ?? movieInfo['original_name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )),
              Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 265,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      movieInfo['overview'] ?? " ",
                      // maxLines: 11,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.grey[400],
                            letterSpacing: .5,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (movieInfo['release_date'] != null)
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Center(
                        child: Text(
                          "Release Date : ${movieInfo['release_date']}" ?? " ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ),
                if (movieInfo['vote_average'] != null)
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Center(
                        child: Text(
                          "Rating : ${(movieInfo['vote_average']).toStringAsFixed(2).toString()}"
                                  "  ⭐" ??
                              " ",
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
