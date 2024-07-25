class AddPostDTO {
  final String? post;

  AddPostDTO({required this.post});

  Map<String, dynamic> toJson() {
    return {
      "post": post,
    };
  }
}
