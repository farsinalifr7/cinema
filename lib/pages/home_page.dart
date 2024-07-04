import 'package:cenima/pages/intro_page.dart';
import 'package:cenima/pages/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
//import 'package:movie/pages/intro_page.dart';
//import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topratedMovies = [];
  List tvshows = [];
  final String apikey = "8d14dec34d77939b025e1bce47bd9e69";
  final String acessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDE0ZGVjMzRkNzc5MzliMDI1ZTFiY2U0N2JkOWU2OSIsIm5iZiI6MTcxOTk5OTE3NS40MzQwMTUsInN1YiI6IjY2ODUxOTVhNGYyNGU3ZTk4MjE3Y2NiMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._5Ltbx3FhsrGad1VD2K0-EM1HgKvvcf5YAh4aImHPjA";

  @override
  void initState() {
    super.initState();
    leadMovies();
  }

  leadMovies() async {
    TMDB tmdbwithcustomlog = TMDB(ApiKeys(apikey, acessToken),
        logConfig: const ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingRusult = await tmdbwithcustomlog.v3.trending.getTrending();
    Map topratedResult = await tmdbwithcustomlog.v3.movies.getTopRated();
    Map TvshowResult = await tmdbwithcustomlog.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingRusult['results'];
      topratedMovies = topratedResult['results'];
      tvshows = TvshowResult['results'];
    });

    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroPage(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroPage(),
                    ));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find your",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      const Text(
                        "Favorite Movie",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[800],
                        ),
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[100],
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey[100],
                              ),
                              hintText: "Search for a movie"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              child: Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Trending Movies",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 275,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingMovies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieTile(
                                        movieInfo: trendingMovies[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 240,
                                      width: 160,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trendingMovies[index]
                                                ['poster_path'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      trendingMovies[index]['title'] ?? " ",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Top Rated Movies",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    //width: 300,
                    //color: Colors.black,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topratedMovies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(7),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieTile(
                                        movieInfo: topratedMovies[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 131,
                                      width: 160,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topratedMovies[index]
                                                ['poster_path'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      topratedMovies[index]['title'] ?? " ",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
