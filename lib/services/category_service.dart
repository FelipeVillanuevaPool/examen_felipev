import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:FelipeV_Examen/models/categoria.dart';

class CategoryService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Lst_cat> category = [];
  Lst_cat? SelectCategoria;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoryService() {
    loadCategorias();
  }
  Future loadCategorias() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoriasMap = Category.fromJson(response.body);
    print(response.body);
    category = categoriasMap.listado;
    isLoading = false;
    notifyListeners();
  }

Future editOrCreateCategoria(Lst_cat categoria, BuildContext context) async {
    isEditCreate = true;
    notifyListeners();
    if (categoria.CategoryId == 0) {
      await this.createCategoria(categoria);
    } else {
      await this.updateCategoria(categoria);
    }

    isEditCreate = false;
    notifyListeners();
    loadCategorias();
   
  }

  Future<String> updateCategoria(Lst_cat categoria) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: categoria.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = category
        .indexWhere((element) => element.CategoryId == categoria.CategoryId);
    category[index] = categoria;

    return '';
  }

  Future createCategoria(Lst_cat categoria) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: categoria.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.category.add(categoria);
    
    return '';
  }

  Future deleteCategoria(Lst_cat categoria, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: categoria.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.category.clear(); //borra todo el listado
    loadCategorias();
   
    return '';
  }

}
