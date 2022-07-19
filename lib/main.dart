import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_apps/view_models/notes_oprations.dart';
import 'package:note_apps/views/add_screen.dart';
import 'package:note_apps/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperations>(
        create: (context) => NotesOperations(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.white, foregroundColor: Colors.blue),
            scaffoldBackgroundColor: Colors.blue,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
          routes: {
            AddScreen.routName: (context) => const AddScreen(),
          },
        ));
  }
}
