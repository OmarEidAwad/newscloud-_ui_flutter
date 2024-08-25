import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool islastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: PageView(
          onPageChanged: (index) {
            setState(() => islastpage = index == 2);
          },
          controller: controller,
          children: [
            OnboardingPage(
              imagePath: 'assets/general.avif', // Add your image asset here
              title: 'Welcome ',
              description: ' Discover amazing news and enjoy using our app  ',
            ),
            OnboardingPage(
              imagePath: "assets/sports.avif",
              title: 'Stay Connected',
              description: 'Keep track of your activities and stay updated.',
            ),
            OnboardingPage(
              imagePath: 'assets/science.avif', // Add your image asset here
              title: 'Get Started',
              description: 'Sign up to get started and explore more.',
              isLastPage: true,
            ),
          ],
        ),
      ),
      bottomSheet: islastpage
          ? Container(
              height: 60,
              color: const Color.fromARGB(255, 83, 32, 183),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Text(
                  'Click Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        return controller.jumpToPage(3);
                      },
                      child: Text("Skip")),
                  Center(
                    child: SmoothPageIndicator(
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                        controller: controller,
                        count: 3),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text("Next")),
                ],
              ),
            ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        // Background Image
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        // Gradient Overlay
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // Content
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 125),
            Text(
              title,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
