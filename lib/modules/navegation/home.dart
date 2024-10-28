import 'package:finanzas_app/modules/navegation/restaurant.dart';
import 'package:finanzas_app/modules/navegation/restaurantDescription.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('restaurantes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No restaurants found'));
          }

          // Convertir cada documento a una instancia de Restaurant usando el DTO
          final restaurants = snapshot.data!.docs.map((doc) {
            return Restautant.fromFirestore(
                doc.id, doc.data() as Map<String, dynamic>);
          }).toList();

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return ListTile(
                title: Text(
                  restaurant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Nombre en negritas
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.description), // Descripción del restaurante
                    SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          Icons.star,
                          color: starIndex < restaurant.rating
                              ? Colors.amber // Estrellas pintadas
                              : Colors.grey, // Estrellas no pintadas
                        );
                      }),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RestaurantDescription(restaurant: restaurant),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
