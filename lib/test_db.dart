import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'dart:convert';

import 'amplifyconfiguration.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> missionNames = []; // Liste des noms de mission

  @override
  void initState() {
    super.initState();
    configureAmplify();
    fetchData();
  }

  void configureAmplify() async {
    try {
      await Amplify.addPlugins([AmplifyAPI()]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('An error occurred during Amplify configuration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppSync Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Query'),
                onPressed: fetchData,
              ),
              SizedBox(height: 20),
              Text('Mission Names:'),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: missionNames.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(missionNames[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> fetchData() async {
    try {
      final operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document:
          'query MyQuery {listMissions {nextToken,startedAt,items {id,nb_point,nom}}}',
        ),
      );

      final response = await operation.response;

      if (response.errors.isNotEmpty) {
        print('GraphQL Errors: ${response.errors}');
      } else {
        print('GraphQL Data: ${response.data}');

        // Extraction des noms de mission
        final jsonData = json.decode(response.data!);
        final List<dynamic> missions = jsonData['listMissions']['items'];
        final List<String> names = missions
            .map((mission) => mission['nom'] != null ? mission['nom'].toString() : '')
            .toList();

        setState(() {
          missionNames = names;
        });
      }
    } catch (e) {
      print('An error occurred during the GraphQL query: $e');
    }
  }

}

void main() {
  runApp(MyApp());
}
