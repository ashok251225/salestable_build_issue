import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/check_in_apis/upload_file_api.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_widgets.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/models/upload_file_response.dart';
import 'package:salestable/controllers/edit_file_controller.dart';
import 'package:salestable/pages/edit_check_in/partials/preview_edit_checkin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:folder_file_saver/folder_file_saver.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';

// ignore: must_be_immutable
class EditCheckinAdditionalFile extends StatelessWidget {
  final EditFileController _editFileController = Get.put(EditFileController());
  String message = '';
  UploadedData? uploadedData;
  num statusCode = 0;

  EditCheckinAdditionalFile({super.key});

  Future<void> sendFile(File file) async {
    CustomResponse<UploadFileResponse> response =
        await UploadFileAPI().call(file: file);
    switch (response.statusCode) {
      case 200:
      case 201:
        statusCode = response.data!.statusCode;
        uploadedData = response.data!.data;
        message = response.data!.message;

        if (statusCode == 200) {
        } else {}
        break;

      default:
        message = response.data!.message.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditFileController>(builder: (_editFileController) {
      return (Support.filetoString(_editFileController.additionalFile) != '' &&
              _editFileController.uploading == false)
          ? SizedBox(
              height: 70,
              child: Stack(
                children: [
                  FilePreviewEditCheckin(
                    urlFile: Support.filetoString(
                        _editFileController.additionalFile),
                    onDownload: _downloadFile,
                    onReplace: _replaceFile,
                    onDelete: _deleteFile,
                  ),
                  if (_editFileController.uploading)
                    Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).gradientColor1),
                      ),
                    ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: MediumStyleTitle(
                      text: 'Additional File?',
                      color: FlutterFlowTheme.of(context).mediumText,
                      fontSize: 14,
                    )),
                  ].divide(const SizedBox(width: 15)),
                ),
                Stack(children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: SvgPicture.asset(
                                              'assets/images/Upload_Image.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Recommended file types: All',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () {
                                            _editFileController.uploading
                                                ? null
                                                : _selectFile();
                                          },
                                          text: 'Select File',
                                          options: FFButtonOptions(
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .regularTitleGreen,
                                                      fontSize: 12,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .regularTitleGreen,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_editFileController.uploading)
                    Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).gradientColor1),
                      ),
                    ),
                ]),
              ].divide(const SizedBox(height: 12)),
            );
    });
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _editFileController.setUploading(true);
      File file = File(result.files.single.path ?? "");
      try {
        await sendFile(file);
        if (statusCode == 200) {
          _editFileController.setadditionalFile(File(uploadedData?.url ?? ''));

          successSnackBar('File uploaded successfully!');
        } else {
          errorSnackBar(message);
        } // Upload the selected file
      } catch (error) {
        print('Error during upload: $error');
        // Add any error handling logic here if needed
      }
      _editFileController.setUploading(false);
    }
  }

  void _replaceFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _editFileController.setUploading(true);

      File file = File(result.files.single.path ?? "");

      try {
        await sendFile(file);
        if (statusCode == 200) {
          _editFileController.setadditionalFile(File(uploadedData?.url ?? ''));

          successSnackBar('File replaced successfully!');
        } else {
          errorSnackBar(message);
        }
      } catch (error) {
        if (kDebugMode) {
          print('Error during upload: $error');
        }
        // Add any error handling logic here if needed
      }
      _editFileController.setUploading(false);
    }
  }

  void _downloadFile() async {
    final url = Support.filetoString(_editFileController.additionalFile);

    String fileName = url.split("/").last;
    Directory? appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/$fileName";

    await Permission.storage.request();
    await Dio().download(url, savePath);
    await FolderFileSaver.saveFileToFolderExt(savePath);

    successSnackBar('File downloaded successfully!');
  }

  void _deleteFile() {
    _editFileController.clearadditionalFile();
    successSnackBar('File deleted successfully!');
  }
}
