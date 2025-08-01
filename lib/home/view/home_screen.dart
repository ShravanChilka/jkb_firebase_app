import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/explore/view/explore_screen.dart';
import 'package:jkb_firebase_app/home/view_model/home_view_model.dart';
import 'package:jkb_firebase_app/profile/view/profile_screen.dart';
import 'package:jkb_firebase_app/search/view/search_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (_, vm) => vm.selectedDestinationIndex,
      builder: (context, selectedDestinationIndex, child) {
        return Scaffold(
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
        return ExploreScreen();
      case HomeNavigationDestination.search:
        return SearchScreenProvider();
      case HomeNavigationDestination.profile:
        return ProfileScreen();
    }
  }
}
