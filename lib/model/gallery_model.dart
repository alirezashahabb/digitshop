class GalleryModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? image;
  String? productId;
  String? updated;

  GalleryModel(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.id,
      this.image,
      this.productId,
      this.updated});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    image =
        'https://startflutter.ir/api/files/$collectionId/$id/${json['image']}';
    productId = json['product_id'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['id'] = id;
    data['image'] = image;
    data['product_id'] = productId;
    data['updated'] = updated;
    return data;
  }
}
