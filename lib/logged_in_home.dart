import 'package:flutter/material.dart';

import 'fragments/accoun_fragment.dart';

class LoggedInHome extends StatefulWidget {
  const LoggedInHome({super.key});

  @override
  State<LoggedInHome> createState() => _LoggedInHomeState();
}

class _LoggedInHomeState extends State<LoggedInHome> {
  int selectedIndex = 0;
  List<Widget> homePages = [
    const Center(child: Text("Yet To Be Implimented 1")),
    const Center(child: Text("Yet To Be Implimented 2")),
    const Center(child: Text("Yet To Be Implimented 3")),
    const Center(child: AccountFragment()),
    const Center(child: Text("Yet To Be Implimented 5")),
  ];

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        backgroundColor: Colors.purple[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: homePages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.query_stats), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.currency_exchange,
              ),
              label: "balance"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.security,
              ),
              label: "Security"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2,
              ),
              label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings"),
        ],
        currentIndex: selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.purple[900],
        unselectedItemColor: Colors.grey[700],
        backgroundColor: Colors.white,
        showSelectedLabels: false,
      ),
    );
  }
}
