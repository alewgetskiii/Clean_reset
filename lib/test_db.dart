import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'dart:convert';

import 'amplifyconfiguration.dart';

import 'models/Mission.dart';
import 'slideMenu.dart';

class MissionListPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MissionListPage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      final operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: '''query MyQuery {
  listMissions {
    nextToken
    items {
      nom
      point
      description
      id
    }
  }
}


              ''',
        ),
      );

      final response = await operation.response;

      if (response.errors.isNotEmpty) {
        print('GraphQL Errors: ${response.errors}');
      } else {
        // Extraction des noms de mission
        final jsonData = json.decode(response.data!); //decodage du json
        final List<dynamic> missions = jsonData['listMissions']
            ['items']; //extraction uniquement de la liste des missions
        String jsonString = json.encode(missions); //rencodage du json

        missionsList = createMissionListFromJson(
            jsonString); //transformation du json en une liste d'objet de classe Mission

        if (missionsList.isNotEmpty) {}
      }
    } catch (e) {
      print('An error occurred during the GraphQL query: $e');
    }
  }

  List<Mission> createMissionListFromJson(String jsonString) {
    List<Mission> missionList = [];
    List<dynamic> jsonList = json.decode(jsonString);
    for (var jsonData in jsonList) {
      Mission mission = Mission.fromJson(jsonData);
      missionList.add(mission);
    }

    return missionList;
  }

  void navigateToMissionPage(Mission currentMission) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MissionPage(
                currentMission: currentMission,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text("mes mission"),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: missionsList.length,
                  itemBuilder: (context, index) {
                    final currentMission = missionsList[index];

                    return Card(
                      child: ListTile(
                        leading: const FlutterLogo(size: 56.0),
                        title: Text(currentMission.nom!),
                        subtitle: Text(currentMission.description!),
                        trailing: Text(currentMission.point.toString()!),
                        onTap: () {
                          navigateToMissionPage(currentMission);
                        },
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

class MissionPage extends StatelessWidget {
  final Mission currentMission;

  const MissionPage({required this.currentMission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma mission'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentMission.nom!,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action du bouton à implémenter
              },
              child: const Text('Mon bouton'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MissionListPage());
}
