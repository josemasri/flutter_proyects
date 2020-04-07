import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/pelicula_search_res_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Captain America',
  ];
  final peliculasRecientes = [
    'Spiderman',
    'Captain America',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro searchbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del searchbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.length < 4) {
      return Container();
    }
    return FutureBuilder(
      future: PeliculasProvider.getSearch(query),
      builder: (BuildContext context, AsyncSnapshot<MovieSearchRes> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data.results;
          return ListView(
            children: peliculas.map((pelicula) {
              pelicula.uniqueId = '${pelicula.id}-search';
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
                leading: Hero(
                  tag: pelicula.uniqueId,
                  child: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      width: 50.0,
                      fit: BoxFit.contain,
                      image: NetworkImage(PeliculasProvider.getImg(
                        pelicula.posterPath,
                      ))),
                ),
                title: Text(
                  '${pelicula?.title}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  '${pelicula.releaseDate.split('-')[0]}',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                trailing: Column(
                  children: [
                    Icon(Icons.star, color: Colors.yellowAccent,),
                    Text('${pelicula?.voteAverage}')
                  ],
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
