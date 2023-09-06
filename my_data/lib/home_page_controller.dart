import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'result.dart';

class UserData {
  var username = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = ''.obs;
}

class HomePageController extends GetxController {
  final UserData userData = UserData();

  void submitForm() {
    Get.to(ResultPage(userData: userData));
  }

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      userData.profileImage.value = pickedFile.path;
    }
  }
}
