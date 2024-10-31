import 'package:flutter/material.dart';
import 'package:learn_programming_app/screens/home_screen.dart';
import 'package:learn_programming_app/screens/login_screen.dart';
import 'package:learn_programming_app/screens/course_list_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Programming App',
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.resize(600, name: TABLET),
          const ResponsiveBreakpoint.resize(800, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700, name: '4K'),
        ],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/courses': (context) => const CourseListScreen(),
        // Tidak perlu menambahkan rute langsung ke halaman detail karena kita menggunakan MaterialPageRoute di dalam CourseListScreen.
      },
    );
  }
}
