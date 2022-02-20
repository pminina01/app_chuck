import 'package:networking_examples/api.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/ip_joke.dart';

Api api = Api();
const _imageUrl2 =
    'https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png';

class Joke extends StatefulWidget {
  final String category;

  const Joke(this.category);

  @override
  _JokeState createState() => _JokeState();
}

class _JokeState extends State<Joke> {
  final _imageUrl = 'https://api.chucknorris.io/img/favicon.ico';
  Api api = Api();
  late final String category;
  late Future<List> futureData;

  @override
  void initState() {
    super.initState();
    category = widget.category;
    print(category);
    futureData = api.fetchJoke(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chucky Joke'),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic>? data = snapshot.data;
              return SafeArea(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        data![6],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(5, 15, 0.0, 0.0),
                      child: new Image.network(
                        _imageUrl2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
