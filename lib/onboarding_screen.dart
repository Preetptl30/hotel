import 'package:flutter/material.dart';

void main() {
  runApp(OnboardingApp());
}

class OnboardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboarding1.png",
      "title": "Welcome",
      "desc": "This is the best app to get things done."
    },
    {
      "image": "assets/onboarding2.png",
      "title": "Stay Organized",
      "desc": "Manage your tasks and projects easily."
    },
    {
      "image": "assets/onboarding3.png",
      "title": "Get Started",
      "desc": "Let’s begin your productivity journey!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onboardingData[index]['image']!,
                  height: 300,
                ),
                SizedBox(height: 40),
                Text(
                  onboardingData[index]['title']!,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  onboardingData[index]['desc']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40),
                if (index == onboardingData.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to login or home screen
                    },
                    child: Text("Get Started"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
