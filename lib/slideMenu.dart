import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'test_db.dart';


class SlideMenuPage extends StatefulWidget {
  const SlideMenuPage({Key? key}) : super(key: key);

  @override
  _SlideMenuPageState createState() => _SlideMenuPageState();
}

class _SlideMenuPageState extends State<SlideMenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _menuItems = ['Menu 1', 'Menu 2', 'Menu 3'];

  @override
  void initState() {
    super.initState();
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
          TabBar(
            controller: _tabController,
            tabs: _menuItems.map((item) => Tab(text: item)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _menuItems.map((item) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item, style: TextStyle(fontSize: 24)),
                      ElevatedButton(
                        onPressed: navigateToAnotherPage,
                        child: Text('Missions'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page.'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SlideMenuPage(),
  ));
}
