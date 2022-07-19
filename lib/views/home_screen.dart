import 'package:flutter/material.dart';
import 'package:note_apps/product/padding.dart';
import 'package:note_apps/product/widgets/notes_card.dart';
import 'package:note_apps/view_models/notes_oprations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTittle = 'NotesHelper';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addScreen');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(appTittle),
      ),
      body: Consumer<NotesOperations>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.getNotes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const PagePadding.all(),
                child: NotesCard(
                  note: value.getNotes[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
