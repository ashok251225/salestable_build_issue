import 'package:flutter/material.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/pulse_apis/add_reaction_api.dart';
import 'package:salestable/backend/services/pulse_apis/delete_post_api.dart';
import 'package:salestable/models/delete_post_response.dart';
import 'package:salestable/models/reaction_response.dart';
import '../../../../core/flutter_flow/flutter_flow_util.dart';
import 'pinned_post_card_widget.dart' show PinnedPostCardWidget;

class PinnedPostCardModel extends FlutterFlowModel<PinnedPostCardWidget> {
  /// Initialization and disposal methods.
  int statusCode = 0;

  String message = '';
  void initState(BuildContext context) {}

  void dispose() {}

  Future<void> addReaction(
      {required String reactionType, required String postId}) async {
    CustomResponse<ReactionResponse> response =
        await AddReactionAPI().call(reactionType: reactionType, postId: postId);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;

        break;

      default:
        message = response.data!.message.toString();
    }
  }

  Future<void> deletePost({required String postId}) async {
    CustomResponse<DeletePostResponse> response =
        await DeletePostAPI().call(postId: postId);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;

        break;

      default:
        message = response.data!.message.toString();
    }
  }
}
