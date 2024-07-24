import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration:  InputDecoration(labelText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.blueGrey)),prefixIcon: const Icon(Icons.person),prefixIconColor: Colors.blue,),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.blueGrey)),prefixIcon: const Icon(Icons.email),prefixIconColor: Colors.blue,),),SizedBox(height: 10,),
            TextField(
              controller: phoneController,
              decoration:  InputDecoration(labelText: 'Phone Number',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.blueGrey)),prefixIcon: const Icon(Icons.phone),prefixIconColor: Colors.blue,),
            ),
        SizedBox(height: 10,),
        Obx(()=>
            TextField(
              controller: passwordController,
              decoration:  InputDecoration(labelText: 'Password', border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
                prefixIcon: const Icon(Icons.password, color: Colors.blue),
                suffixIcon: GestureDetector(
                  onTap: authController.toggleObscureText,
                  child: Icon(
                    authController.obscureText.value ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
              obscureText: authController.obscureText.value,),
      ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.register(
                  nameController.text,
                  emailController.text,
                  phoneController.text,
                  passwordController.text,
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
