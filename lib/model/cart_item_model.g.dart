// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  final int typeId = 0;

  @override
  CartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemModel(
      category: fields[0] as String?,
      collectionId: fields[1] as String?,
      collectionName: fields[2] as String?,
      created: fields[3] as String?,
      description: fields[4] as String?,
      discountPrice: fields[5] as int?,
      id: fields[6] as String?,
      name: fields[7] as String?,
      popularity: fields[8] as String?,
      price: fields[9] as int?,
      quantity: fields[10] as int?,
      thumbnail: fields[11] as String?,
      updated: fields[12] as String?,
      realPeice: fields[13] as int?,
      persent: fields[14] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.collectionId)
      ..writeByte(2)
      ..write(obj.collectionName)
      ..writeByte(3)
      ..write(obj.created)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.discountPrice)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.quantity)
      ..writeByte(11)
      ..write(obj.thumbnail)
      ..writeByte(12)
      ..write(obj.updated)
      ..writeByte(13)
      ..write(obj.realPeice)
      ..writeByte(14)
      ..write(obj.persent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
