class VaraintTypeModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;
  String? updated;

  VaraintTypeModel(
      {this.collectionId,
      this.collectionName,
      this.created,
      this.id,
      this.name,
      this.title,
      this.type,
      this.updated});

  VaraintTypeModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    type = _getTypeEnum(json['type']);
    updated = json['updated'];
  }
}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.COLOR;
    case 'Storage':
      return VariantTypeEnum.STORAGE;
    case 'Voltage':
      return VariantTypeEnum.VOLTAGE;
    default:
      return VariantTypeEnum.COLOR;
  }
}

enum VariantTypeEnum { COLOR, STORAGE, VOLTAGE }
