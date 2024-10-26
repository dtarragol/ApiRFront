import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/services/api/image.dart';
import 'package:apir_front/src/services/api/property.dart';
import 'package:apir_front/src/ui/screens/PropertyDetail.dart';
import 'package:apir_front/src/ui/widgets/CustomCard.dart';
import 'package:apir_front/src/ui/widgets/CustomSearchAppBar.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter/material.dart';

class SearchProperties extends StatefulWidget {
  const SearchProperties({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchProperties> {
  String _searchQuery = '';
  List<PropertyModel> _properties = [];
  List<String> _propertyImages = [];

  void _onSearchChanged(String query) async {
    var listProperties = await ApiPropertyGet.searchProperties(query);
    List<String> propertyImages = [];
    for (var property in listProperties) {
      var imageUrl = await ApiImageGet.firstByPropertyId(property.id);
      propertyImages.add(ApiUrlConstants.baseUrl + imageUrl.url);
    }
    setState(() {
      _searchQuery = query;
      _properties = listProperties;
      _propertyImages = propertyImages;
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
          ? Center(child: Text('No se han encontrado propiedades con la búsqueda: $_searchQuery'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: _properties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomCard(
                    imageUrl: _propertyImages[index],
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PropertyDetail(_properties[index])),
                      );
                    },
                    text: _properties[index].name,
                  ),
                );
              },
            ),
    );
  }
}