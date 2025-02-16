import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/home_page.dart';
import 'screens/search_travels_page.dart';
import 'screens/notifications_page.dart';
import 'screens/my_travels_page.dart';
import 'screens/price_monitoring_page.dart';
import 'screens/settings_page.dart';
import 'screens/search_results_page.dart';
import 'utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/searchResults') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => SearchResultsPage(
              origin: args['origin'],
              destination: args['destination'],
              departureDate: args['departureDate'],
            ),
          );
        }
        return null;
      },
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/notifications': (context) => NotificationsPage(),
        '/analytics': (context) => PriceMonitoringPage(),
        '/settings': (context) => SettingsPage(),
        '/mytravels': (context) => MyTravelsPage(),
        '/search': (context) => SearchTravelsPage(),
      },
      theme: ThemeData(
        primarySwatch: customSwatch,
        primaryColor: customSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
