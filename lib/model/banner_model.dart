class BannerModel {
  String? categoryId;
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? thumbnail;
  String? updated;

  BannerModel(
      {this.categoryId,
      this.collectionId,
      this.collectionName,
      this.created,
      this.id,
      this.thumbnail,
      this.updated});

  BannerModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    thumbnail =
        'https://startflutter.ir/api/files/$collectionId/$id/${json['thumbnail']}';
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['updated'] = updated;
    return data;
  }
}
