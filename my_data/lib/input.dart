import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'inputget.dart';

void main() {
  runApp(HomePage());
}

class UserData {
  var username = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = ''.obs;
}

class HomePage extends StatelessWidget {
  final UserData userData = UserData();

  HomePage({super.key});

  void _submitForm() {
    Get.to(ResultPage(userData: userData));
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      userData.profileImage.value = pickedFile.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input User Data')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              onChanged: (value) => userData.username.value = value,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              onChanged: (value) => userData.name.value = value,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              onChanged: (value) => userData.email.value = value,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              onChanged: (value) => userData.phoneNumber.value = value,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              onChanged: (value) => userData.address.value = value,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            ElevatedButton(
              onPressed: () => _getImage(),
              child: Text('Pick Profile Image'),
            ),
            ElevatedButton(
              onPressed: () => _submitForm(),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeP extends StatelessWidget {
  const HomeP({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
