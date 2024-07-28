import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/image_utils.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';

class MovieView extends StatelessWidget {
  const MovieView({required this.data, required this.onClick, super.key});

  final MovieEntity data;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(

        width: 130,
        height: 250,
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    ImageUtils.getFinalImageUrl(
                        ImageQuality.w500, data.posterPath ?? ''),
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                    // loadingBuilder: (ctx,obj,trace){
                    //   return const Icon(Icons.image);
                    // },
                    errorBuilder: (ctx,obj,trace){
                      return const Icon(Icons.error,);
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,

                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber
                    ),
                    child: Center(
                      child: Text("${data.voteAverage}/10",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8,),

            Text('${data.releaseDate}')
          ],
        ),
      ),
    );
  }
}
