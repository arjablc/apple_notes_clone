import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:flutter/cupertino.dart';

class Notes with ChangeNotifier {
  final String title;
  final String id = UniqueKey().toString();
  final String content;
  final String folderId = 'quick_note';

  Notes({required this.title, required this.content});
}

class NotesListProvider with ChangeNotifier {
  final List<Notes> _list = [];
  List<Notes> get notesList => [..._list];
}
