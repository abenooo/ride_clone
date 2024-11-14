import 'auth/welcome_screen.dart';
import '/screens/onboarding/screen1.dart';
import '/screens/onboarding/screen2.dart';
import '/screens/onboarding/screen3.dart';
// import '/screens/onboarding/screen4.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // for android
      debugShowMaterialGrid: false,
      // iphone
      debugShowCheckedModeBanner: false,
      title: 'Ride App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 19, 172, 108)),
        useMaterial3: true,
      ),
      home:
          const SplashScreen(), // Update to a splash screen that checks onboarding
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  // Function to check if onboarding is complete
  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? completedOnboarding = prefs.getBool('completedOnboarding') ?? false;

    if (completedOnboarding) {
      // If onboarding was completed, go directly to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else {
      // Otherwise, go to the onboarding screens
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Alpha Digital Tracking')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child:
              CircularProgressIndicator()), // Simple loading indicator while checking onboarding status
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  String buttonText = "Skip";
  int currentPageIndicator = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageIndicator = index;
              if (index == 2) {
                buttonText = "Finish";
              } else {
                buttonText = "Skip";
              }
              setState(() {});
            },
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
              // Screen4(),
            ],
          ),
          Container(
            alignment:
                const Alignment(0, 0.9), // Move content lower on the screen
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensures content is compact and respects alignment
              children: [
                // Page indicator in a single row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                    ),
                  ],
                ),
                const SizedBox(
                    height: 20), // Space between indicator and button

                // Full-width "Next" button
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Optional padding for aesthetics

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008955),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (currentPageIndicator == 2) {
                          _completeOnboarding();
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        currentPageIndicator == 2 ? "Get Started" : "Next",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to mark onboarding as complete
  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('completedOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }
}
