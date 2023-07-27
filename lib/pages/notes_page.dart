import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:apple_notes_clone/pages/folders_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    Key? key,
    required this.folderId,
  }) : super(key: key);
  static const routeName = "/notes-pate";
  final String folderId;

  @override
  Widget build(BuildContext context) {
    //a variable to store the number of notes in a folder along with their
    //notes Id;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(20),
            ),
            Consumer<NotesDataProvider>(builder: (context, value, child) {
              List<Notes> folderedNotesList = value.getFolderedNoets(folderId);
              return (folderedNotesList.isEmpty)
                  ? const Center(
                      child: Text("No Notes"),
                    )
                  : CupertinoListSection.insetGrouped(
                      children: List.generate(
                          folderedNotesList.length,
                          (index) => CupertinoListTile(
                                title: Text(
                                    folderedNotesList[index].generateNoteTitle),
                              )),
                    );
            })
          ],
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        //Push and remove until used to empty the navigation stack upto the folder part
        onTap: () => Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => const FoldersPage()),
            ModalRoute.withName("/folder-page")),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.left_chevron,
              color: CupertinoColors.systemYellow,
            ),
            Text(
              "Folders",
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CupertinoColors.systemYellow, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
