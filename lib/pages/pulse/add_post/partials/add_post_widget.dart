// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_editor/rich_editor.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_model.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/large_style_title.dart';
import '../add_pulse_model.dart';

class AddPulseQuillEditor extends StatefulWidget {
  const AddPulseQuillEditor({Key? key}) : super(key: key);

  @override
  _AddPulseQuillEditorState createState() => _AddPulseQuillEditorState();
}

class _AddPulseQuillEditorState extends State<AddPulseQuillEditor> {
  late AddPulseModel _model;
  GlobalKey<RichEditorState> keyEditor = GlobalKey();
  bool isTapped = false;

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => AddPulseModel());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).cardColor,
          centerTitle: true,
          title: LargeStyleTitle(
              text: ('New Post'),
              color: FlutterFlowTheme.of(context).primaryText),
        ),
        backgroundColor: FlutterFlowTheme.of(context).cardColor,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: SizedBox(
            height: 32,
            child: FloatingActionButton.extended(
              extendedPadding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              elevation: 5,
              backgroundColor: FlutterFlowTheme.of(context).gradientColor1,
              foregroundColor: const Color(0xffffffff),
              onPressed: () {
                setState(() {
                  isTapped = true;
                });
                addPostMethod();
              },
              label: isTapped
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color:
                              FlutterFlowTheme.of(context).regularTitleWhite),
                    )
                  : const Text(
                      'Post',
                      style: TextStyle(fontSize: 16),
                    ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the value as needed
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: RichEditor(
                key: keyEditor,
                editorOptions: RichEditorOptions(
                  enableVideo: false,
                  placeholder: 'Start typing',
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  baseFontFamily: 'sans-serif',
                  barPosition: BarPosition.BOTTOM,
                ),
                getImageUrl: (image) {
                  try {
                    String base64 = base64Encode(image.readAsBytesSync());
                    String base64String = 'data:image/png;base64,$base64';
                    print('Base64 Image: $base64String');
                    return base64String;
                  } catch (e) {
                    print('Error converting image to base64: $e');
                    return null; // or return a placeholder image URL
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addPostMethod() async {
    String? html = await keyEditor.currentState?.getHtml();
    print(html);
    Support().clearPulseFilters();
    await _model.fetchAddPulsePost(post: html!);

    setState(() {});

    if (_model.statusCode == 200) {
      successSnackBar(_model.message);
      Get.toNamed(Routes.pulse);
      await keyEditor.currentState?.unFocus();
    } else {
      errorSnackBar(_model.message);
      return;
    }
  }
}
