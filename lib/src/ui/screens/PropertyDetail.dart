import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/ui/widgets/ImageCasouselCard.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter/material.dart';

class PropertyDetail extends StatelessWidget {
  final PropertyModel property;
  const PropertyDetail(this.property);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.name),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                ImageCarouselCard(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${property.price.toString()} €",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        property.description,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: ClipOval(
                child: Image.network(
                  ApiUrlConstants.image02, // Reemplaza con la URL de tu imagen
                  fit: BoxFit.cover,
                  width: 56, // Ajusta el tamaño según sea necesario
                  height: 56, // Ajusta el tamaño según sea necesario
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error); // Muestra un icono de error si la imagen no se carga
                  },
                ),
              ),
              backgroundColor: Colors.white, // Fondo blanco para el botón
            ),
          ),
        ],
      ),
    );
  }
}