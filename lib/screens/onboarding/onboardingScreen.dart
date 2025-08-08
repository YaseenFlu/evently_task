import 'package:evently_task/utils/app_assets.dart';
import 'package:evently_task/utils/app_colors.dart';
import 'package:evently_task/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'OnboardingPage.dart';
class OnboardingScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;
  OnboardingScreen({required this.toggleTheme, required this.isDarkMode});
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingPage(
                image:AppAssets.onboardingImage1,
                title: 'Find Events That Inspire You',
                description:
                'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
              ),
              OnboardingPage(
                image: AppAssets.onboardingImage2,
                title: 'Effortless Event Planning',
                description:
                'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we\'ve got you covered. Plan with ease and focus on what matters — creating an unforgettable experience for you and your guests.',
              ),
              OnboardingPage(
                image: AppAssets.onboardingImage3,
                title: 'Connect with Friends & Share Moments',
                description:
                'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
              ),
            ],
          ),

          Positioned(
            bottom: 0,
           left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ?_currentPage > 0
                    ? Container(
                    padding:const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue),
                        shape:BoxShape.circle
                    ),
                    child: IconButton(
                      icon:Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),//icon:Image.asset(AppAssets.iconBack,color: Theme.of(context).textTheme.bodyMedium?.color),
                      onPressed:() {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    ),
                   ):null,
                  SizedBox(width: 20),
                  Row(
                    children: List.generate(3, (index) => buildDot(index)),
                  ),
                  SizedBox(width: 20),
                  _currentPage < 2
                      ? Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Theme.of(context).iconTheme.color),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  )
                      : ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      //backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    icon:Icon(Icons.check_circle_outline, color:Theme.of(context).iconTheme.color),
                    label:Text(
                      'Get Started',
                      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                    ),
                    onPressed: () {
                      Navigator.push(context,AppRoutes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            //bottom: 40,
            left: 20,
            top: 70,
            child: Switch(
              value: widget.isDarkMode,
              onChanged: widget.toggleTheme,
              activeColor: Theme.of(context).iconTheme.color,
            ),
          ),

    // Positioned(
    // //left: 90,
    // top: 70,
    // right: 20,
    // child:ElevatedButton.icon(
    // style: ElevatedButton.styleFrom(
    // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    // //backgroundColor: AppColors.blue,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    // ),
    // icon:Icon(Icons.login, color:Theme.of(context).iconTheme.color),
    // label:Text(
    // 'login',
    // style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
    // ),
    // onPressed: () {
    // Navigator.push(context, AppRoutes.login);
    // },
    // ),
    // ),
        ],
      )
    );
  }
  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
