import 'package:flutter/material.dart';
import 'package:salestable/core/Dto/add_comment_dto.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/pulse_apis/add_comment_api.dart';
import 'package:salestable/backend/services/viewpost_api.dart';
import 'package:salestable/models/add_comment_response.dart';
import 'package:salestable/models/viewpost_response.dart';

import '../../../../components/notifications/notifications_count_widget.dart';
import '../../../../core/flutter_flow/flutter_flow_util.dart';
import 'view_pinned_post_widget.dart' show ViewPinnedPostWidget;

class ViewPostModel extends FlutterFlowModel<ViewPinnedPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  int statusCode = 0;

  String message = '';

  late List<CommentData> comments;

  // Model for NotificationBell component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    textFieldFocusNode?.dispose();
    commentTextController?.dispose();
  }

  Future<void> addCommentToPost(
      {String comment = '', required String postId}) async {
    addCommentDto commentDto = addCommentDto(comment: comment);
    CustomResponse<AddCommentResponse> response =
        await AddCommentAPI().call(commentDto: commentDto, postId: postId);

    message = '';
    switch (response.statusCode) {
      case 200:
      case 201:
        statusCode = response.data!.statusCode;

        message = response.data!.message.toString();
        break;

      default:
        message = response.data!.message.toString();
    }
  }

  Future<List<CommentData>> fetchviewpost({required String postId}) async {
    CustomResponse<ViewPostResponse> response =
        await getviewpostapi().call(postId: postId);
    if (response.statusCode == 200) {
      comments = response.data!.data;
      statusCode = response.data!.statusCode;
      return comments;
    }
    return comments;
  }
  // Future<void> addReaction(
  //     {required String reactionType, required String postId}) async {
  //   CustomResponse<ReactionResponse> response =
  //       await AddReactionAPI().call(reactionType: reactionType, postId: postId);

  //   switch (response.statusCode) {
  //     case 200:
  //     case 201:
  //       message = response.data!.message;
  //       statusCode = response.data!.statusCode;

  //       break;

  //     default:
  //       message = response.data!.message.toString();
  //   }
  // }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
