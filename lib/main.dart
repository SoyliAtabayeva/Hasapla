import 'package:flutter/material.dart';
import 'package:newpro/models/actions.dart';
import 'package:newpro/provider/main_provider.dart';
import 'package:newpro/ui/homePage.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ActionsofPage>(
          create: (_) => ActionsofPage(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(255, 144, 59, 208),
            onBackground: Colors.white,
            onError: Colors.red,
            onSecondary: Colors.white,
            onSurface: Colors.white,
            background: Colors.yellow,
            secondary: Color.fromARGB(255, 144, 59, 208),
            surface: Color(0xFF0A0E21),
            secondaryVariant: Colors.white,
            error: Colors.red,
            primaryVariant: Color(0xFF0A0E21),
            onPrimary: Color.fromARGB(255, 243, 244, 248),
            brightness: Brightness.light,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'hello',
        home: HomePage(),
      ),
    );
  }
}
