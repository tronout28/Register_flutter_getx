import 'dart:io';
import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${userData.username}'),
            Text('Name: ${userData.name}'),
            Text('Email: ${userData.email}'),
            Text('Phone Number: ${userData.phoneNumber}'),
            Text('Address: ${userData.address}'),
            userData.profileImage.value.isNotEmpty
                ? Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Image.file(
                        File(userData.profileImage.value),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
