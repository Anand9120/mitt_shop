import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LOGIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=>
            TextField(
              controller: authController.emailController.value,
              decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.blueGrey)),prefixIcon: const Icon(Icons.email),prefixIconColor: Colors.blue,),
            ),),
            const SizedBox(height: 10,),
        Obx(
              ()=>TextField(
          controller: authController.passwordController.value,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
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
                authController.login( authController.emailController.value.text,
                  authController.passwordController.value.text,);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: const Text('Don\'t have an account? Register here'),
            ),
          ],
        ),
      ),
    );
  }
}
