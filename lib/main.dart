import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/notes_page.dart';
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
          "/": (context) => const NotesPage(
                folderId: "notes",
              ),
          "/folder-page": (context) => const FoldersPage()
        },
        theme: customTheme.customLightTheme,
        darkTheme: customTheme.darkThemeData,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
