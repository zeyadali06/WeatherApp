import 'package:flutter/material.dart';
import 'package:weather_app/Features/AuthFeature/Presentation/Views/AuthOptionsBody.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthOptionsBody(),
    );
  }
}
