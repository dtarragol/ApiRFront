import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/services/api/image.dart';
import 'package:apir_front/src/services/api/property.dart';
import 'package:apir_front/src/services/api/user.dart';
import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:apir_front/src/ui/widgets/CustomCard.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter/material.dart';

class MyProperties extends StatefulWidget {
  const MyProperties({super.key});

  @override
  _MyPropertiesState createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  List<PropertyModel> _properties = [];
  List<String> _propertyImages = [];

  void _loadUser() async {
    var idUser = await ApiUserGet.getIdUserLog();
    var properties = await ApiPropertyGet.byIdUser(idUser);
    List<String> propertyImages = [];
    for (var property in properties) {
      var imageUrl = await ApiImageGet.firstByPropertyId(property.id);
      propertyImages.add(ApiUrlConstants.baseUrl + imageUrl.url);
    }
    setState(() {
      _properties = properties;
      _propertyImages = propertyImages;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _properties.isEmpty
              ? Center(child: Text('No properties available'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  itemCount: _properties.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomCard(
                        imageUrl: _propertyImages[index],
                        onPressed: () {
                          // Acción al presionar la tarjeta
                        },
                        text: _properties[index].name,
                      ),
                    );
                  },
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: AppTheme.accentColor,
              onPressed: () {
                // Acción al presionar el botón +
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}