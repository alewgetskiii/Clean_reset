import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'dart:convert';

import 'amplifyconfiguration.dart';

class MissionListPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MissionListPage> {
  List<String> missionNames = [];// Liste des noms de mission

  @override
  void initState() {
    fetchData;
    super.initState();
    configureAmplify();
  }

  void configureAmplify() async {
    try {
      await Amplify.addPlugins([AmplifyAPI()]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('An error occurred during Amplify configuration: $e');
    }
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

  @override
  Widget build(BuildContext context) {
    fetchData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppSync Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text('Mission Names:'),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: missionNames.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text(missionNames[index]),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
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





}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MissionListPage());
}
