// To parse this JSON data, do
//
//     final listPostCategoryResponse = listPostCategoryResponseFromJson(jsonString);

import 'dart:convert';

ListPostCategoryResponse listPostCategoryResponseFromJson(String str) => ListPostCategoryResponse.fromJson(json.decode(str));

String listPostCategoryResponseToJson(ListPostCategoryResponse data) => json.encode(data.toJson());

class ListPostCategoryResponse {
    final List<CategoryData> data;
    final int statusCode;
    final String message;

    ListPostCategoryResponse({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    factory ListPostCategoryResponse.fromJson(Map<String, dynamic> json) => ListPostCategoryResponse(
        data: List< CategoryData>.from(json["data"].map((x) =>  CategoryData.fromJson(x))),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
    };
}

class  CategoryData {
    final int id;
    final String uuid;
    final String name;
    final String pictureIcon;
    final String colorCode;

     CategoryData({
        required this.id,
        required this.uuid,
        required this.name,
        required this.pictureIcon,
        required this.colorCode,
    });

    factory  CategoryData.fromJson(Map<String, dynamic> json) =>  CategoryData(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        pictureIcon: json["picture_icon"],
        colorCode: json["color_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "picture_icon": pictureIcon,
        "color_code": colorCode,
    };
}
