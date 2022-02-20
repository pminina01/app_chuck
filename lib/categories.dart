import 'package:networking_examples/api.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/ip_categories.dart';
import 'package:networking_examples/joke.dart';
const url = '/jokes/categories';
Api api = Api();

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _imageUrl = 'https://api.chucknorris.io/img/favicon.ico';
  late Future<List<String>?> futureData;
  Api api = Api();

  @override
  void initState() {
    super.initState();
    futureData = api.fetchCategories();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _showDialog();
            },
            child: const Text('INFO'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<String>?>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String>? data = snapshot.data;
              return SafeArea(
                child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Joke(data != null ? data[index] : '-1')));
                        },
                        child: Container(
                          height: 75,
                          color: Colors.white,
                          child: Center(
                            child: Text(data != null ? data[index] : '-1'),
                          ),
                        ),
                      );
                    }),
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

  void _showDialog() {
    showAboutDialog(
        context: context,
        applicationName: 'ChucknorrisJokes app',
        applicationIcon: Image.network(_imageUrl, fit: BoxFit.fill),
        children: [
          Text(
              'Polina Minina is author of this application. She is 3 year student of Innopolis University.'),
        ]);
  }
}
