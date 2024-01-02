// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Catagory {
  String name;
  String image;
  Catagory({
    required this.name,
    required this.image,
  });

  Catagory copyWith({
    String? name,
    String? image,
  }) {
    return Catagory(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory Catagory.fromMap(Map<String, dynamic> map) {
    return Catagory(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Catagory.fromJson(String source) =>
      Catagory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Catagory(name: $name, image: $image)';

  @override
  bool operator ==(covariant Catagory other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
