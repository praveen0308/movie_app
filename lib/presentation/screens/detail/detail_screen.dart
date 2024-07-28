import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';
import 'package:movie_app/presentation/navigation/app_router.gr.dart';
import 'package:movie_app/presentation/screens/detail/detail_screen_cubit.dart';
import 'package:movie_app/presentation/widgets/cast_view.dart';
import 'package:movie_app/presentation/widgets/detail_view_container.dart';
import 'package:movie_app/presentation/widgets/home_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.movie});

  final MovieEntity movie;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  void initState() {
    super.initState();

    context.read<DetailScreenCubit>().loadMovieDetail(widget.movie.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          BlocConsumer<DetailScreenCubit, DetailScreenState>(
            listener: (context, state) {
              if (state is Error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is LoadingDetails) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ReceivedDetails) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Poster + Watch trailer (Videos API)
                      Image.network(
                        state.details.movieDetail.posterPath ?? "",
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fill,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              if (state.trailer != null) {
                                AutoRouter.of(context).push(YoutubeFullRoute(
                                    videoId: state.trailer?.key ?? ''));
                              }
                            },
                            child: const Text("Watch trailer")),
                      ),
                      // YoutubePlayer(
                      //   controller: _controller,
                      //   showVideoProgressIndicator: true,
                      //   progressIndicatorColor: Colors.amber,
                      //   progressColors: const ProgressBarColors(
                      //     playedColor: Colors.amber,
                      //     handleColor: Colors.amberAccent,
                      //   ),
                      //   onReady: () {
                      //     _controller.addListener(listener);
                      //   },
                      // ),
                      // Movie Name

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          state.details.movieDetail.originalTitle ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),

                      // Other details like genres overview, release , runtime
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            state.details.movieDetail.overview ?? "Overview"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Released On ${state.details.movieDetail.releaseDate}'),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailViewContainer(
                                title: "Popularity",
                                value: state.details.movieDetail.popularity
                                        ?.toStringAsFixed(0) ??
                                    ""),
                            DetailViewContainer(
                                title: "Vote Average",
                                value: state.details.movieDetail.voteAverage
                                        .toString() ??
                                    ""),
                            DetailViewContainer(
                                title: "Vote Count",
                                value: state.details.movieDetail.voteCount
                                        .toString() ??
                                    ""),
                            DetailViewContainer(
                                title: "Runtime",
                                value:
                                    '${state.details.movieDetail.runtime} mins.'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Casts credits API
                      SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Cast',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  final cast = state.details.cast[index];
                                  return CastView(cast: cast);
                                },
                                itemCount: state.details.cast.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Recommendations API
                      HomeSection(
                        title: 'Recommendations',
                        items: state.details.recommendations,
                      )
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).back();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    child: const Icon(Icons.arrow_back_rounded),
                    radius: 20,
                  ))),
        ],
      ),
    ));
  }
}
