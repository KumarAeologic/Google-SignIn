import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchPeople(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://swapi.dev/api/people/?format=json'));

  var data = await json.decode(response.body);
  return data;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Star War API'),
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
        future: fetchPeople(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PeopleList(people: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final dynamic people;

  PeopleList({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var results = people['results'];

    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        var person = results[index];
        var name = person['name'];
        var eyecolor = person['eye_color'];
        var height = person['height'];
        var gender = person['gender'];
        var birth_year = person['birth_year'];
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 13),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(65),
                  2: FixedColumnWidth(80),
                  0: FixedColumnWidth(70),
                  3: FixedColumnWidth(55),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      children: [
                        TableCell(
                            child: Container(
                              height: 50,
                              color: Colors.greenAccent,
                              child: const Center(
                                child: Text("Name",style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),

                        TableCell(
                            child: Container(
                              height: 50,
                              color: Colors.greenAccent,
                              child: const Center(
                                child: Text("Eye Color",style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),
                        TableCell(
                            child: Container(
                              height: 50,
                              color: Colors.greenAccent,
                              child: const Center(
                                child: Text("Height",style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),
                        TableCell(
                            child: Container(
                              height: 50,
                              color: Colors.greenAccent,
                              child: const Center(
                                child: Text("Gender",style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),
                        TableCell(
                            child: Container(
                              height: 50,
                              color: Colors.greenAccent,
                              child: const Center(
                                child: Text("Birth Year",style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),
                      ]
                  ),
                  TableRow(
                      children: [
                        TableCell(
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Text("$name",style: const TextStyle(
                                    fontSize: 12,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )
                        ),
                        TableCell(
                            child: Center(
                              child: Text("$eyecolor",style: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold
                              ),),
                            )),
                        TableCell(
                            child: Center(
                              child: Text("$height",style: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold
                              ),),
                            )),
                        TableCell(
                            child: Center(
                              child: Text("$gender",style: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold
                              ),),
                            )),
                        TableCell(
                            child: Center(
                              child: Text("$birth_year",style: const TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold
                              ),),
                            )),]
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

