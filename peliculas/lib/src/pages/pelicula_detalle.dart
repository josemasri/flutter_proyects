import 'package:flutter/material.dart';

import 'package:peliculas/src/models/cast.dart';
import 'package:peliculas/src/models/credits_res.dart';
import 'package:peliculas/src/models/crew.dart';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10.0,
              ),
              _posterTitulo(context, pelicula),
              _descripcion(context, pelicula),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Cast',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              _casting(context, pelicula),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Crew',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              _crew(context, pelicula),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          appbarTitle(pelicula.title),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(PeliculasProvider.getImg(pelicula.backdropPath)),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String appbarTitle(String title) {
    if (title.length > 28) {
      return '${title.substring(0, 28)}...';
    }
    return title;
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image:
                    NetworkImage(PeliculasProvider.getImg(pelicula.posterPath)),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                pelicula.originalTitle,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border, color: Colors.yellow,),
                  Text(
                    pelicula.voteAverage.toString(),
                    style: Theme.of(context).textTheme.subhead,
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _descripcion(BuildContext context, Pelicula pelicula) {
    PeliculasProvider.getCredits(pelicula.id).then(print);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _casting(BuildContext context, Pelicula pelicula) {
    return FutureBuilder(
      future: PeliculasProvider.getCredits(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot<CreditsRes> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data.cast);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _crew(BuildContext context, Pelicula pelicula) {
    return FutureBuilder(
      future: PeliculasProvider.getCredits(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot<CreditsRes> snapshot) {
        if (snapshot.hasData) {
          return _crearCrewPageView(snapshot.data.crew);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearActoresPageView(List<Cast> cast) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          pageSnapping: false,
          itemCount: cast.length,
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1,
          ),
          itemBuilder: (context, i) => _actorTarjeta(cast[i])),
    );
  }

  Widget _actorTarjeta(Cast actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(
                  PeliculasProvider.getImg(actor.profilePath, type: '')),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _crearCrewPageView(List<Crew> crew) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          pageSnapping: false,
          itemCount: crew.length,
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1,
          ),
          itemBuilder: (context, i) => _crewTarjeta(crew[i])),
    );
  }

  Widget _crewTarjeta(Crew crew) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(
                  PeliculasProvider.getImg(crew.profilePath, type: '')),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            crew.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
