import 'package:FelipeV_Examen/screen/list_categoria_screen.dart';
import 'package:FelipeV_Examen/screen/list_producto_screen.dart';
import 'package:FelipeV_Examen/screen/list_proveedor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainScreenState();
}

class _MainScreenState extends State<Main> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const ListProveedoresScreen(),
    const ListCategoryScreen(),
    const ListProductScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: const Text('Ecommerce'),
          actions: [
            PopupMenuButton<int>(
               onSelected: (int value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  onTap: (){
                    _pageIndex = 0;
                  },
                  value: 0,
                  child: Text('Proveedores'),
                ),
                PopupMenuItem(
                  onTap: (){
                    
                    _pageIndex = 1;
                  },
                  value: 1,
                  child: Text('Categorias'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Productos'),
                ),
              ],
            )
          ],
        ),
        body: _pages[_pageIndex],
    );
    
  }
}