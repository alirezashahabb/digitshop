import 'package:flutter/material.dart';

class VaraintsModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? name;
  int? priceChange;
  String? productId;
  String? typeId;
  String? updated;
  String? value;

  VaraintsModel({
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.name,
    this.priceChange,
    this.productId,
    this.typeId,
    this.updated,
    this.value,
  });

  VaraintsModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    name = json['name'];
    priceChange = json['price_change'];
    productId = json['product_id'];
    typeId = json['type_id'];
    updated = json['updated'];
    value = json['value'];
  }
  // Convert the hex color string to a Flutter Color
  Color getColor() {
    return Color(int.parse('0xff$value'));
  }
}
