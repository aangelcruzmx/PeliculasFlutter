import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.56,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details_screen', arguments: movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
