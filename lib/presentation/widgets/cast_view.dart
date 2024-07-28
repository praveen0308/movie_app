import 'package:flutter/material.dart';
import 'package:movie_app/domain/entity/cast_entity.dart';

class CastView extends StatelessWidget {
  const CastView({super.key, required this.cast});
  final CastEntity cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              cast.profilePath ?? "",
              height: 80,
              width: 80,
              fit: BoxFit.fill,

              errorBuilder: (ctx,obj,trace){
                return const Icon(Icons.error);
              },
            ),
          ),
          Text(
            cast.character ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          Text(
            cast.originalName ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
