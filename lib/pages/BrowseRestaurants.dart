import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BrowseRestaurantPage extends StatefulWidget {
  const BrowseRestaurantPage({super.key});

  @override
  State<BrowseRestaurantPage> createState() => _BrowseRestaurantPageState();
}

class _BrowseRestaurantPageState extends State<BrowseRestaurantPage> {
  Widget _title() {
    return const Text('Browse Restaurants');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("restaurants").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            Text("${snapshot.data!.docs[index].get("name")}"),
                        title: Text(
                          "rating: ${snapshot.data!.docs[index].get("rating")}",
                        ),
                        subtitle: Text(
                            "miles away: ${snapshot.data!.docs[index].get("miles away")}"),
                      );
                    });
              }
              return Container();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
