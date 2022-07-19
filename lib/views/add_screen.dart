// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:note_apps/product/padding.dart';
import 'package:note_apps/view_models/notes_oprations.dart';

class AddScreen extends StatelessWidget {
  static const String routName = '/addScreen';

  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTittle = 'NotesHelper';
    final TextEditingController textEditingTitleController =
        TextEditingController();
    final TextEditingController textEditingDecController =
        TextEditingController();

    final String? args = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTittle),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              title: (args?.isNotEmpty ?? false)
                  ? context.read<NotesOperations>().fetchNotes(args).tittle
                  : 'Enter Title',
              fontWeight: FontWeight.bold,
              controller: textEditingTitleController,
            ),
            Expanded(
              child: CustomCard(
                title: (args?.isNotEmpty ?? false)
                    ? context
                        .read<NotesOperations>()
                        .fetchNotes(args)
                        .description
                    : 'Enter Description',
                controller: textEditingDecController,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                context.read<NotesOperations>().addNewNote(
                    textEditingTitleController.text,
                    textEditingDecController.text);
                Navigator.pop(context);
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final TextEditingController controller;
  const CustomCard({
    Key? key,
    required this.title,
    this.fontWeight,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const PagePadding.all(),
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            controller.text = value;
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            filled: true, //<-- SEE HERE
            fillColor: Colors.white,
            labelText: title,
            prefixText: ' ',
            labelStyle: TextStyle(color: Colors.blue, fontWeight: fontWeight),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
