import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/services/api/user.dart';
import 'package:apir_front/src/ui/widgets/CustomCard.dart';
import 'package:apir_front/src/ui/widgets/CustomSearchAppBar.dart';
import 'package:flutter/material.dart';

class SearchProperties extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchProperties> {
  String _searchQuery = '';
  List<PropertyModel> _properties = [];

  void _onSearchChanged(String query) async {
      var listProperties = await ApiUserPost.searchProperties(query);
    setState(() {
      _searchQuery = query;
      _properties = listProperties;
    });
  }

  void _onFilterPressed() {
    // Acción al presionar el botón de filtro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(
        hintText: 'Buscar...',
        onSearchChanged: _onSearchChanged,
        onFilterPressed: _onFilterPressed,
      ),
      body: _properties.isEmpty
          ? Center(child: Text('No se han encontrado propiedades con la busqueda: $_searchQuery'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: _properties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomCard(
                    onPressed: () {
                      // Acción al presionar la tarjeta
                    },
                    text: _properties[index].name,
                  ),
                );
              },
            ),
    );
  }
}