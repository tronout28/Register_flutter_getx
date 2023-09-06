import 'dart:io';
import 'package:flutter/material.dart';
import 'home_page_controller.dart';
import 'input.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;

  ResultPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Data Result')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.grey[200], // Warna latar belakang abu-abu terang
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .start, // Mengatur tulisan menjadi rata kiri
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Mengatur tulisan menjadi rata kiri
                children: [
                  userData.profileImage.value.isNotEmpty
                      ? ClipOval(
                          child: Image.file(
                            File(userData.profileImage.value),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                  SizedBox(height: 16),
                  _buildInfoItem(
                      Icons.person_outline_outlined, ': ${userData.username}'),
                  _buildInfoItem(Icons.person, ': ${userData.name}'),
                  _buildInfoItem(Icons.email, ': ${userData.email}'),
                  _buildInfoItem(Icons.phone, ': ${userData.phoneNumber}'),
                  _buildInfoItem(Icons.location_on, ': ${userData.address}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon), // Menambahkan ikon
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
