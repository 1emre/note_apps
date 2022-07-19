// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  final String? key;
  String tittle;
  String description;

  Note({this.key, required this.tittle, required this.description});

  @override
  String toString() =>
      'Note(key: $key, tittle: $tittle, description: $description)';
}
