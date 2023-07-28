import 'package:apple_notes_clone/widgets/bottom_bar.dart';
import 'package:apple_notes_clone/widgets/edit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:apple_notes_clone/models/folders_provider.dart';
import 'package:apple_notes_clone/models/notes_provider.dart';
import 'package:apple_notes_clone/widgets/custom_back_button.dart';

class EditViewPage extends StatefulWidget {
  const EditViewPage({
    Key? key,
    required this.noteId,
    required this.folderId,
    required this.isNewNote,
    required this.isQuickNote,
  }) : super(key: key);
  final String noteId;
  final String folderId;
  final bool isNewNote;
  final bool isQuickNote;

  @override
  State<EditViewPage> createState() => _EditViewPageState();
}

class _EditViewPageState extends State<EditViewPage> {
  //* variables
  Notes? currentNote;
  Document _document = Document();

  @override
  void initState() {
    //getting the current note
    currentNote = (widget.isNewNote)
        ? Notes(content: '', folderId: widget.folderId)
        : Provider.of<NotesDataProvider>(context, listen: false)
            .getNoteById(widget.noteId);
    putOldValueInEditor();

    super.initState();
  }
  // *methods

//To put the initial value of the note in the eidtor
  void putOldValueInEditor() {
    _document = Document()..insert(0, currentNote!.content);
    setState(
      () {
        _controller = QuillController(
          document: _document,
          selection: const TextSelection.collapsed(offset: 0),
        );
      },
    );
  }

  //for going back
  void navigateBack(BuildContext context) async {
    changeNotes(context, currentNote!, _controller.document.toPlainText());
    Navigator.pop(context);
  }

  //getting folder name for the back button
  String getFolderName() {
    return Provider.of<FolderDataProvider>(context)
        .getFolderNameById(widget.folderId);
  }

  // if it is a new note creating a new object and then passing the data into the new
  //object if nto updating the existing data
  void changeNotes(BuildContext context, Notes currentNote, String content) {
    if (widget.isNewNote) {
      Provider.of<NotesDataProvider>(context, listen: false)
          .addNewNote(currentNote);
    }
    Provider.of<NotesDataProvider>(context, listen: false)
        .updateExistingNote(content, currentNote);
  }

//* controllers
  QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        changeNotes(context, currentNote!, _controller.document.toPlainText());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading:
              Consumer<FolderDataProvider>(builder: (context, value, child) {
            return CustomBackButton(
                text: widget.isQuickNote ? "Folders" : getFolderName(),
                navigationFunction: navigateBack);
          }),
          leadingWidth: double.infinity,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.ellipsis_vertical_circle,
                  color: CupertinoColors.systemYellow,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: QuillEditor(
                padding: const EdgeInsets.all(15),
                autoFocus: false,
                expands: true,
                scrollable: true,
                scrollController: _scrollController,
                focusNode: _focusNode,
                readOnly: false,
                controller: _controller,
              ),
            ),
            BottomBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 40,
                    child: SvgPicture.asset(
                        isDarkMode
                            ? "assets/checklist_dark.svg"
                            : "assets/checklist_light.svg",
                        width: 35)),
                const Icon(CupertinoIcons.camera),
                const Icon(CupertinoIcons.pencil_outline),
                const EditButton(
                    initiateQuickNote: true, callingFolderId: "quicknotes")
              ],
            )
                //! The buttons provided by flutter_quill
                // controller: _controller,
                // showUndo: false,
                // showFontFamily: false,
                // showBoldButton: false,
                // showAlignmentButtons: false,
                // showClearFormat: false,
                // showUnderLineButton: false,
                // showColorButton: false,
                // showSmallButton: false,
                // showBackgroundColorButton: false,
                // showCenterAlignment: false,
                // showRedo: false,
                // showCodeBlock: false,
                // showDirection: false,
                // showFontSize: false,
                // showItalicButton: false,
                // showHeaderStyle: false,
                // showListNumbers: false,
                // showSubscript: false,
                // showSuperscript: false,
                // showSearchButton: false,
                // showDividers: false,
                // showIndent: false,
                // showInlineCode: false,
                // showJustifyAlignment: false,
                // showLeftAlignment: false,
                // showLink: false,
                // showQuote: false,
                // showStrikeThrough: false,
                // showListBullets: false,
                // showListCheck: true,
                // )
                )
          ],
        ),
      ),
    );
  }
}
