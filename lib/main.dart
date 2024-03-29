import 'package:flutter/material.dart';
import 'package:flutter_base_tutorial/home_page.dart';
import 'package:flutter_base_tutorial/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // DEBUG banner, If you set this property to false , banner will be disappeared.
      debugShowCheckedModeBanner: false,

      //theme
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const RootPage(),
    );
  }
}

//
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //
  int currentPage = 0;

//
  List<Widget> pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Base'),
      ),

      //
      body: pages[currentPage],

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Add object');
        },
        child: const Icon(Icons.add),
      ),

      //
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        //
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
