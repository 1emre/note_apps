import 'package:flutter/material.dart';

import '../../models/note.dart';

class NotesCard extends StatelessWidget {
  final Note note;
  const NotesCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        //context.read<NotesOperations>().fetchNotes(note.key);
        Navigator.pushNamed(context, '/addScreen', arguments: note.key);
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 10,
        child: ListTile(
          title: Text(
            note.tittle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(note.description,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
