// ignore_for_file: unnecessary_null_comparison
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Input User Data'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          controller.userData.profileImage.value != null
                              ? FileImage(
                                  File(controller.userData.profileImage.value))
                              : null,
                      backgroundColor: Color(0xff272829),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => controller.getImage(),
                    child: Icon(Icons.camera),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) =>
                        controller.userData.username.value = value,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) =>
                        controller.userData.name.value = value,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) =>
                        controller.userData.email.value = value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) =>
                        controller.userData.phoneNumber.value = value,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) =>
                        controller.userData.address.value = value,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 26, 26, 26)),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => controller.submitForm(),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
