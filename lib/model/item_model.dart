// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  int id;
  String image;
  String name;
  String desc;
  int price;
  String time;
  String calories;
  String rating;
  String placeholderImage;
  ItemModel({
    required this.id,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    required this.time,
    required this.calories,
    required this.rating,
    required this.placeholderImage,
  });

  ItemModel copyWith({
    int? id,
    String? image,
    String? name,
    String? desc,
    int? price,
    String? time,
    String? calories,
    String? rating,
    String? placeholderImage,
  }) {
    return ItemModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      time: time ?? this.time,
      calories: calories ?? this.calories,
      rating: rating ?? this.rating,
      placeholderImage: placeholderImage ?? this.placeholderImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'desc': desc,
      'price': price,
      'time': time,
      'calories': calories,
      'rating': rating,
      'placeholderImage': placeholderImage,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as int,
      time: map['time'] as String,
      calories: map['calories'] as String,
      rating: map['rating'] as String,
      placeholderImage: map['placeholderImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, image: $image, name: $name, desc: $desc, price: $price, time: $time, calories: $calories, rating: $rating, placeholderImage: $placeholderImage)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.image == image &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.time == time &&
      other.calories == calories &&
      other.rating == rating &&
      other.placeholderImage == placeholderImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      image.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      time.hashCode ^
      calories.hashCode ^
      rating.hashCode ^
      placeholderImage.hashCode;
  }
}
