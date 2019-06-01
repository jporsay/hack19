import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:hack19/src/authentication/authentication_provider.dart';
import 'package:hack19/src/occasion/occasion_repository.dart';
import 'package:hack19/src/page/home_page.dart';
import 'package:hack19/src/page/login_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<OccasionRepository>.value(value: OccasionRepository()),
        Provider<AuthenticationProvider>.value(value: AuthenticationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: <NavigatorObserver>[observer],
        home: LoginPage(
          message: "Sign in to continue using our app",
        ),
      ),
    );
  }
}
