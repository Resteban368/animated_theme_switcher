import 'package:animated_theme/theme/theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: Themes.lightTheme,
        builder: (context, myTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: myTheme,
            home: const HomeScreen(),
          );
        });
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var darkTheme = Themes.darkTheme;
    var lightTheme = Themes.lightTheme;
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (context) {
              return IconButton(
                icon: Icon(
                  ThemeModelInheritedNotifier.of(context).theme.brightness ==
                          Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                onPressed: () {
                  var brightness =
                      ThemeModelInheritedNotifier.of(context).theme.brightness;
                  ThemeSwitcher.of(context).changeTheme(
                    theme:
                        brightness == Brightness.light ? darkTheme : lightTheme,
                    isReversed: brightness == Brightness.light ? true : false,
                  );
                },
              );
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/baneste.png",
                width: 200,
                height: 200,)
            ),
            const SizedBox(height: 20),
            Text(
              "Baneste Codes",
              style: theme.textTheme.titleLarge,
            ),
            Text(
              "Flutter Developer",
              style: theme.textTheme.titleMedium,
            ),
            
          ],
        ),
      ),
    );
  }
}
