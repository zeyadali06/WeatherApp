import 'package:flutter/material.dart';
import 'package:weather_app/Features/HomeFeature/Presentation/Views/Widgets/HomeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
