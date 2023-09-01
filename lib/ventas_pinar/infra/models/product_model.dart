// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String? fotoUrl;
    double price;
    String name;
    bool available;
    String? id;

    ProductModel({
         this.fotoUrl,
         this.price = 0.0,
         this.name = '',
         this.available = true,
         this.id,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        fotoUrl: json["fotoUrl"],
        price: json["price"],
        name: json["name"],
        available: json["available"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fotoUrl": fotoUrl,
        "price": price,
        "name": name,
        "available": available,
        "id": id,
    };
}
