import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'EG Computer Specialisten',
              style: TextStyle(color: Colors.orange.withOpacity(1.0)),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/egcs.jpg'),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                ),
                child: Center(
                  child: Text(
                    'Mijn stage plaats',
                    style: TextStyle(height: 2.0, fontSize: 30),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                ),
                child: Text(
                  'naam: EG Computer Specialisten',
                  style: TextStyle(height: 2.0, fontSize: 15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                ),
                child: Text(
                  'adres: Markt 3b, Nijverdal',
                  style: TextStyle(height: 2.0, fontSize: 15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                ),
                child: Text(
                  'openingstijden: 9.00 - 18.00 \n maandag tot/met zaterdag',
                  style: TextStyle(height: 2.0, fontSize: 15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                ),
                child: Text(
                  'omschrijving: Hier kan je computers, \n laptops en assesoires halen voor \n werk/ school en persoonlijk gebruik. \n ook worden hier sites gemaakt voor klanten.',
                  style: TextStyle(height: 2.0, fontSize: 15),
                ),
              ),
            ],
          )),
    ),
  );
}
