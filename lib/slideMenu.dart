import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'test_db.dart';
import 'models/Mission.dart';
import 'package:amplify_api/amplify_api.dart';
import 'tindergift.dart';

class SlideMenuPage extends StatefulWidget {
  const SlideMenuPage({Key? key}) : super(key: key);

  @override
  _SlideMenuPageState createState() => _SlideMenuPageState();
}

List<Mission> missionsList = [];

class _SlideMenuPageState extends State<SlideMenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<List<String>> _menuItems = [
    ['TinderGift', 'assets/welcome0.png'],
    ['Carte', 'assets/welcome0.png'],
    ['Missions', 'assets/welcome0.png']
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
    _tabController = TabController(length: _menuItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void navigateToAnotherPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MissionListPage()),
    );
  }

  void navigateToTinderPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TinderGift()),
    );
  }

  void logout() async {
    try {
      await Amplify.Auth.signOut();
      print('Logout successful');
    } catch (e) {
      print('An error occurred during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _menuItems.map((item) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item[0], style: TextStyle(fontSize: 24)),
                      Image.asset(item[1]),
                      ElevatedButton(
                        onPressed: () {
                          if (item[0] == 'TinderGift') {
                            // Rediriger vers la page correspondante au bouton Menu 1
                            navigateToTinderPage();
                          } else if (item[0] == 'Carte') {
                            navigateToAnotherPage();
                          } else if (item[0] == 'Missions') {
                            navigateToAnotherPage();
                          }
                        },
                        child: Text(item[0]),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logout, // Appelle la méthode de déconnexion
        child: Icon(Icons.logout), // Icône à afficher dans le bouton
        backgroundColor: Colors.red, // Couleur de fond du bouton
        foregroundColor: Colors.white, // Couleur de l'icône
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, // Position du bouton
    );
  }
}

Future<void> fetchData() async {
  try {
    final operation = Amplify.API.query(
      request: GraphQLRequest<String>(
        document:
            '''
            query MyQuery {
  listMissions {
    nextToken
    items {
      id
      nom
      point
      description
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

void main() {
  runApp(const MaterialApp(
    home: SlideMenuPage(),
  ));
}
