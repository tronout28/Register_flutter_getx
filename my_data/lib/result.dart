import 'dart:io';
import 'package:flutter/material.dart';
import 'home_page_controller.dart';

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
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: userData.profileImage.value.isNotEmpty
                        ? ClipOval(
                            child: Image.file(
                              File(userData.profileImage.value),
                              width: 150, 
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(),
                  ),
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
          Icon(icon),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
