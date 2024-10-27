import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProviders>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en Cines'), // Titulo en el AppBar
        elevation: 0, // Sin sombra en el AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Widget para mostrar las tarjetas deslizables de peliculas
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Widget para mostrar el slider de peliculas populares
            MovieSlider(
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}