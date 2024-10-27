import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/movies/presentation/screens/popular_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopluarComponent extends StatelessWidget {
  const PopluarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) =>
              previous.popularRequest != current.popularRequest,
          builder: (context, state) {
           // print("BlocBuilder PoplurMovies");
            return Column(children: [
              Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PopularScreen(popularMovies:state.popularMovies )));
                  //Navigator.push( context, MaterialPageRoute(builder: (ctx)=> MovieDetailScreen(id: state.popularMovies[])));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      MovieDetailScreen(id: movie.id)));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )


            ],);
             
          },
        )
      ],
    );
  }
}
