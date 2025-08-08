
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppAssets.appHorizontalLogo),height: 40),
          SizedBox(height: 20),
          Image.asset(image, height: 300),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.headlineSmall?.color),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16,
                color: Theme.of(context).textTheme.bodyMedium?.color),
            )
          ),
        ],
      ),
    );
  }
}