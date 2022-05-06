import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/theme/theme_bloc.dart';
import 'package:rksi_bloc/resources/theme/app_theme.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(const SwitchDarkMode(null)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          var themeMode = context.read<ThemeBloc>().themeMode;

          if (state is ThemeLoading) {}

          return MaterialApp(
            title: 'РКСИ',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: const ScheduleScreen(),
          );
        },
      ),
    );
  }
}
