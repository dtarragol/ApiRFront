import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/models/UserModel.dart';
import 'package:apir_front/src/services/api/property.dart';
import 'package:apir_front/src/services/api/user.dart';
import 'package:apir_front/src/ui/widgets/CustomCard.dart';
import 'package:flutter/material.dart';

class MyProperties extends StatefulWidget {
  @override
  _MyPropertiesState createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  
  List<PropertyModel> _properties = [];

  void _loadUser() async {
      var idUser = await ApiUserGet.getIdUserLog();
      var properties = await ApiPropertyGet.byIdUser(idUser);
    setState(() {
      _properties = properties;
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
      body: _properties.isEmpty
          ? Center(child: Text('No properties available'))
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