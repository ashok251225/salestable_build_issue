class addCommentDto {
  final String comment;

  addCommentDto({
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
        'comment': comment,
      };
}
