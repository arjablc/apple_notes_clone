import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/notes_provider.dart';
import 'models/folders_provider.dart';
import 'constants/custom_theme.dart';
import 'pages/folders_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final customTheme = CustomTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FolderDataProvider()),
        ChangeNotifierProvider(create: (_) => NotesDataProvider())
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => FoldersPage(),
        },
        theme: customTheme.customTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
