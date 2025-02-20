class PropertisModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? productId;
  String? title;
  String? updated;
  String? value;

  PropertisModel(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.id,
      this.productId,
      this.title,
      this.updated,
      this.value});

  PropertisModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    updated = json['updated'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['id'] = id;
    data['product_id'] = productId;
    data['title'] = title;
    data['updated'] = updated;
    data['value'] = value;
    return data;
  }
}
