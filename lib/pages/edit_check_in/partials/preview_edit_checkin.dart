import 'package:flutter/material.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

class FilePreviewEditCheckin extends StatelessWidget {
  final dynamic urlFile;

  final VoidCallback onDownload;
  final VoidCallback onReplace;
  final VoidCallback onDelete;

  const FilePreviewEditCheckin({
    super.key,
    required this.urlFile,
    required this.onDownload,
    required this.onReplace,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final fileName = urlFile.split('/').last;
    final truncatedFileName = fileName.length > 20
        ? '${fileName.substring(0, 17)}...'
            "${fileName.substring(fileName.length - 10)}"
        : fileName;

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    truncatedFileName,
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert_outlined,
                  size: 20,
                  color: FlutterFlowTheme.of(context).iconColor,
                ),
                onPressed: () => openSheet(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void openSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download'),
              onTap: () {
                onDownload();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Replace'),
              onTap: () {
                onReplace();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                onDelete();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
