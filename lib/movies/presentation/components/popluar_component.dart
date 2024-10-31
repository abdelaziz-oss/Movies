import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/app_string.dart';
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
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16.0.w, 24.0.h, 16.0.w, 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.popular,
                        style: GoogleFonts.poppins(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => PopularScreen(
                                      popularMovies: state.popularMovies)));
                          //Navigator.push( context, MaterialPageRoute(builder: (ctx)=> MovieDetailScreen(id: state.popularMovies[])));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Row(
                            children: [
                              const Text(
                                AppString.seeMore,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0.r,
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
                    height: 170.0.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      itemCount: state.popularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.popularMovies[index];
                        return Container(
                          padding: EdgeInsets.only(right: 8.0.w),
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
                                  BorderRadius.all(Radius.circular(8.0.r)),
                              child: CachedNetworkImage(
                                width: 120.0.w,
                                fit: BoxFit.cover,
                                imageUrl:
                                    ApiConstance.imageUrl(movie.backdropPath),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0.h,
                                    width: 120.0.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(8.0.r),
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
              ],
            );
          },
        )
      ],
    );
  }
}
