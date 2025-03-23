class CommentModel {
  String id;
  String text;
  String productId;
  String userId;
  String userThumbnailUrl;
  String username;
  String avatar;

  CommentModel(this.id, this.text, this.productId, this.userId,
      this.userThumbnailUrl, this.username, this.avatar);

  factory CommentModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return CommentModel(
        jsonObject['id'],
        jsonObject['text'],
        jsonObject['product_id'],
        jsonObject['user_id'],
        'http://startflutter.ir/api/files/${jsonObject['expand']['user_id']['collectionName']}/${jsonObject['expand']['user_id']['id']}/${jsonObject['expand']['user_id']['avatar']}',
        jsonObject['expand']['user_id']['name'],
        jsonObject['expand']['user_id']['avatar']);
  }
}
