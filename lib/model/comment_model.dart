class CommentModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? productId;
  String? text;
  String? updated;
  String? userId;

  CommentModel(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.id,
      this.productId,
      this.text,
      this.updated,
      this.userId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    productId = json['product_id'];
    text = json['text'];
    updated = json['updated'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['id'] = id;
    data['product_id'] = productId;
    data['text'] = text;
    data['updated'] = updated;
    data['user_id'] = userId;
    return data;
  }
}
