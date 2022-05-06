// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rksi_bloc/bloc/theme/theme_bloc.dart';

// class Menu extends StatelessWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var appTheme = context.watch<ThemeBloc>();
//     return SafeArea(
//       child: Drawer(
//         child: Stack(
//           children: [
//             ListView(
//               padding: EdgeInsets.zero,
//               physics: const ClampingScrollPhysics(),
//               children: [
//                 Switch.adaptive(
//                     value: appTheme.isDarkMode(),
//                     onChanged: (value) {
//                       appTheme.add(SwitchDarkMode(value));

//                     }),
//               ],
//             ),
//             const Positioned(
//               child: Text('Версия 0.1.5 (10)'),
//               bottom: 20,
//               left: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/theme/theme_bloc.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var appTheme = context.watch<ThemeBloc>();
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Stack(
                children: [
                  const Positioned(
                    child: Text(
                      'Тёмная тема',
                      style: itemTextStyle,
                    ),
                    top: 5,
                    left: 0,
                  ),
                  Positioned(
                    child: Switch.adaptive(
                      value: appTheme.isDarkMode(),
                      activeColor: primary,
                      onChanged: (value) {
                        appTheme.add(SwitchDarkMode(value));
                        setState(() {});
                      },
                    ),
                    top: -10,
                    right: -10,
                  )
                ],
              ),
              const Positioned(
                child: Text(
                  'Версия 0.2.0 (11)',
                  style: itemTextStyle,
                ),
                bottom: 0,
                left: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
