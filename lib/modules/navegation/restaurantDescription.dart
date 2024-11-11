import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:finanzas_app/modules/navegation/restaurant.dart';

class RestaurantDescription extends StatefulWidget {
  final Restautant restaurant;

  RestaurantDescription({required this.restaurant});

  @override
  _RestaurantDescriptionState createState() => _RestaurantDescriptionState();
}

class _RestaurantDescriptionState extends State<RestaurantDescription> {
  int _selectedRating = 0;
  Completer<GoogleMapController> _mapController = Completer();
  

  @override
  void initState() {
    super.initState();
    // Inicializa el rating con el valor actual del restaurante
    _selectedRating = widget.restaurant.rating;
  }

  void _updateRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  Future<void> _submitRating() async {
    final restaurantDoc = FirebaseFirestore.instance
        .collection('restaurantes')
        .doc(widget.restaurant.id);

    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(restaurantDoc);

        if (!snapshot.exists) {
          throw Exception("El restaurante no existe en la base de datos");
        }

        int currentCount = snapshot['count'];
        int numRatings = snapshot['numRatings'] ?? 0;

        int newCount = currentCount + _selectedRating;
        int newNumRatings = numRatings + 1;
        int newRating = (newCount ~/ newNumRatings);

        transaction.update(restaurantDoc, {
          'count': newCount,
          'numRatings': newNumRatings,
          'rating': newRating,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Rating actualizado a $_selectedRating estrellas')),
      );
    } catch (e) {
      print("Error al actualizar el rating: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar el rating')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.restaurant.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.restaurant.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Ubicación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Latitud: ${widget.restaurant.latitude}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Longitud: ${widget.restaurant.longitude}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Calificación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < _selectedRating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    _updateRating(index + 1);
                  },
                );
              }),
            ),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('Establecer calificación'),
            ),
            SizedBox(height: 20),
            Text(
              'Imágenes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: widget.restaurant.images.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Mapa de Ubicación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      widget.restaurant.latitude, widget.restaurant.longitude),
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("restaurant_location"),
                    position: LatLng(widget.restaurant.latitude,
                        widget.restaurant.longitude),
                    infoWindow: InfoWindow(title: widget.restaurant.name),
                  ),
                },
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
