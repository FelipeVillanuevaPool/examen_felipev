import 'dart:convert';

class Proveedor {
  Proveedor({
    required this.listado,
  });

  List<Lst_proveedor> listado;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        listado:
            List<Lst_proveedor>.from(json["Proveedores Listado"].map((x) => Lst_proveedor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Lst_proveedor {
  Lst_proveedor({
    required this.ProveedorId,
    required this.ProveedorName,
    required this.ProveedorLastName,
    required this.ProveedorCorreo,
    required this.ProveedorState,
  });

  int ProveedorId;
  String ProveedorName;
  String ProveedorLastName;
  String ProveedorCorreo;
    String ProveedorState;

  factory Lst_proveedor.fromJson(String str) => Lst_proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lst_proveedor.fromMap(Map<String, dynamic> json) => Lst_proveedor(
        ProveedorId: json["providerid"],
        ProveedorName: json["provider_name"],
        ProveedorLastName: json["provider_last_name"],
        ProveedorCorreo: json["provider_mail"],
        ProveedorState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "providerid": ProveedorId,
        "provider_name": ProveedorName,
        "provider_last_name": ProveedorLastName,
        "provider_mail": ProveedorCorreo,
        "provider_state": ProveedorState,
      };

  Lst_proveedor copy() => Lst_proveedor(
      ProveedorId: ProveedorId,
      ProveedorName: ProveedorName,
      ProveedorLastName: ProveedorLastName,
      ProveedorCorreo: ProveedorCorreo,
      ProveedorState: ProveedorState,);
      
}
