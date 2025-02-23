import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel {
  @HiveField(0)
  String? category;
  @HiveField(1)
  String? collectionId;
  @HiveField(2)
  String? collectionName;
  @HiveField(3)
  String? created;
  @HiveField(4)
  String? description;
  @HiveField(5)
  int? discountPrice;
  @HiveField(6)
  String? id;
  @HiveField(7)
  String? name;
  @HiveField(8)
  String? popularity;
  @HiveField(9)
  int? price;
  @HiveField(10)
  int? quantity;
  @HiveField(11)
  String? thumbnail;
  @HiveField(12)
  String? updated;
  @HiveField(13)
  int? realPeice;
  @HiveField(14)
  num? persent;

  CartItemModel({
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

  CartItemModel.fromJson(Map<String, dynamic> json) {
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
}
