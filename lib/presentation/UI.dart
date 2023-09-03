import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/abstarctmethodfor form.dart';
import '../Data/userepo.dart';
import '../Domain/entities/formmodel.dart';

class RegistrationController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

  void register() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    // Validate input
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields.');
      return;
    }

    isLoading.value = true;

    try {
      final user = User(username: username, email: email, password: password);
      // Call the repository to register the user
      await UserRepositoryImpl ().registerUser(user);

      Get.snackbar('Success', 'Registration successful.');
    } catch (e) {
      Get.snackbar('Error', 'Registration failed.');
    } finally {
      isLoading.value = false;
    }
  }
}

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.register(),
              child: Text('Register'),
            ),
            Obx(
                  () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: RegistrationPage()));
}
