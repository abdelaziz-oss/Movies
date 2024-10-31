import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key, required this.popularMovies});
  final List<Movie> popularMovies;

  @override
  Widget build(BuildContext context) {
    //print(popularMovies);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Movies',
          style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w500),
        ),
      ),
      body: Expanded(
          child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: popularMovies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:const EdgeInsets.all(8),
            child: Card(
              color: const Color.fromARGB(255, 28, 28, 28),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        width: 120.0,
                        height: 150,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstance.imageUrl(
                            popularMovies[index].backdropPath),
                      )),
                  Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 247),
                        child: FadeInUp(
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(popularMovies[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.2,
                                    )),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        popularMovies[index]
                                            .releaseDate
                                            .split('-')[0],
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          (popularMovies[index].voteAverage / 2)
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          '(${popularMovies[0].voteAverage})',
                                          style: const TextStyle(
                                            fontSize: 1.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  popularMovies[index].overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
