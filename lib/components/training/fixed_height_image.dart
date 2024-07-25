import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/controllers/training_mark_as_read_controller.dart';

class FixedHeightImage extends StatefulWidget {
  const FixedHeightImage({super.key, required this.contentUrl});

  final String contentUrl;

  @override
  State<FixedHeightImage> createState() => _FixedHeightImageWidgetState();
}

class _FixedHeightImageWidgetState extends State<FixedHeightImage> {
  MarkAsReadController markAsReadController = Get.put(MarkAsReadController());

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.contentUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                markAsReadController.updateIsImageWatched(true);
                // Navigate to full-screen image preview
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SafeArea(
                      child: Scaffold(
                        backgroundColor: Colors.black,
                        body: Stack(
                          children: [
                            Center(
                              child: InteractiveViewer(
                                child: Image.network(
                                  widget.contentUrl,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 15,
                              child: IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
