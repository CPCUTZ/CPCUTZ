import 'package:flutter/material.dart';
import 'package:fixy_pro/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA726),
        title: Text("FixyPro", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Stack(
                children: [
                  // Placeholder for Google Maps API
                  Positioned.fill(
                    child: Container(
                      color: Colors.white,
                      child: Center(child: Placeholder()),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: 'Casa 1',
                        items: ['Casa 1'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey),
                                SizedBox(width: 8),
                                Text(value),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 4),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.handyman, color: Colors.black),
                          SizedBox(width: 8),
                          Text('Servicios Carpintería'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA726),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 5,
                    shadowColor: Colors.black54,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Mis Solicitudes",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF29B6F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 5,
                    shadowColor: Colors.black54,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Inicia Solicitud",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
