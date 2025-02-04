import 'package:flutter/material.dart';

class CategoryItemsModel {
  String? collectionId;
  String? collectionName;
  String? color;
  String? created;
  String? icon;
  String? id;
  String? thumbnail;
  String? title;
  String? updated;

  CategoryItemsModel(
      {this.collectionId,
      this.collectionName,
      this.color,
      this.created,
      this.icon,
      this.id,
      this.thumbnail,
      this.title,
      this.updated});

  CategoryItemsModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    color = json['color'];
    created = json['created'];

    id = json['id'];
    thumbnail =
        'https://startflutter.ir/api/files/$collectionId/$id/${json['thumbnail']}';
    icon =
        'https://startflutter.ir/api/files/$collectionId/$id/${json['icon']}';
    title = json['title'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['color'] = color;
    data['created'] = created;
    data['icon'] = icon;
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    data['updated'] = updated;
    return data;
  }

  // Convert the hex color string to a Flutter Color
  Color getColor() {
    return Color(int.parse('0xff$color'));
  }
}
