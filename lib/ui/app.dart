import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'РКСИ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: primary,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const ScheduleScreen(),
    );
  }
}
