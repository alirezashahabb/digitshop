class ProductModel {
  String? category;
  String? collectionId;
  String? collectionName;
  String? created;
  String? description;
  int? discountPrice;
  String? id;
  String? name;
  String? popularity;
  int? price;
  int? quantity;
  String? thumbnail;
  String? updated;
  int? realPeice;
  num? persent;

  ProductModel({
    this.category,
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.discountPrice,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
    this.updated,
    this.realPeice,
    this.persent,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    description = json['description'];
    discountPrice = json['discount_price'];
    id = json['id'];
    name = json['name'];
    popularity = json['popularity'];
    price = json['price'];
    quantity = json['quantity'];
    thumbnail =
        'https://startflutter.ir/api/files/$collectionId/$id/${json['thumbnail']}';
    updated = json['updated'];
    realPeice = price! + discountPrice!;
    persent = ((price! - realPeice!) / price!) * 100;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['description'] = description;
    data['discount_price'] = discountPrice;
    data['id'] = id;
    data['name'] = name;
    data['popularity'] = popularity;
    data['price'] = price;
    data['quantity'] = quantity;
    data['thumbnail'] = thumbnail;
    data['updated'] = updated;
    return data;
  }
}
