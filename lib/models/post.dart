class Posts {
  Id? iId;
  int? userID;
  String? content;
  String? caption;
  int? likes;
  Id? postID;

  Posts(
      {this.iId,
      this.userID,
      this.content,
      this.caption,
      this.likes,
      this.postID});

  Posts.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    userID = json['userID'];
    content = json['content'] ?? '';
    caption = json['caption'] ?? '';
    likes = json['likes'];
    postID = json['postID'] != null ? Id.fromJson(json['postID']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['userID'] = userID;
    data['content'] = content;
    data['caption'] = caption;
    data['likes'] = likes;
    if (postID != null) {
      data['postID'] = postID!.toJson();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}