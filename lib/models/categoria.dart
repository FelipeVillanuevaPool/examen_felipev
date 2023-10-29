import 'dart:convert';

class Category {
  Category({
    required this.listado,
  });

  List<Lst_cat> listado;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        listado:
            List<Lst_cat>.from(json["Listado Categorias"].map((x) => Lst_cat.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Lst_cat {
  Lst_cat({
    required this.CategoryId,
    required this.CategoryName,
    required this.CategoryState,
  });

  int CategoryId;
  String CategoryName;
  String CategoryState;

  factory Lst_cat.fromJson(String str) => Lst_cat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lst_cat.fromMap(Map<String, dynamic> json) => Lst_cat(
        CategoryId: json["category_id"],
        CategoryName: json["category_name"],
        CategoryState: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": CategoryId,
        "category_name": CategoryName,
        "category_state": CategoryState,
      };

  Lst_cat copy() => Lst_cat(
      CategoryId: CategoryId,
      CategoryName: CategoryName,
      CategoryState: CategoryState);
}
