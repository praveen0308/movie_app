import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entity/home_listing_item.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';
import 'package:movie_app/presentation/navigation/app_router.gr.dart';
import 'package:movie_app/presentation/widgets/movie_view.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<MovieEntity> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(title,style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final movie = items[index];
                return MovieView(
                  data: movie, onClick: () {
                    AutoRouter.of(context).push(DetailRoute(movie: movie));
                },
                );
              },
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
