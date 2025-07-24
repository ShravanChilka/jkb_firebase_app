import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (_, vm) => vm.selectedDestinationIndex,
      builder: (context, selectedDestinationIndex, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Home")),
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedDestinationIndex,
            onDestinationSelected: (index) {
              context.read<HomeViewModel>().onDestinationChangeEvent(index);
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.search), label: "Search"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
          body: _buildBody(selectedDestinationIndex),
        );
      },
    );
  }

  Widget _buildBody(int selectedDestinationIndex) {
    final destination =
        HomeNavigationDestination.values[selectedDestinationIndex];
    switch (destination) {
      case HomeNavigationDestination.home:
        return Container(color: Colors.red);
      case HomeNavigationDestination.search:
        return Container(color: Colors.blue);
      case HomeNavigationDestination.profile:
        return Container(color: Colors.yellow);
    }
  }
}
