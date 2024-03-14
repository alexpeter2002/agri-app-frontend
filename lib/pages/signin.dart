import 'package:flutter/material.dart';
import 'package:agri_app_frontend/services/postservices.dart';
import 'package:agri_app_frontend/pages/account.dart';
import 'package:agri_app_frontend/pages/signin.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController farmerMobileController = TextEditingController();
  final TextEditingController farmerPasswordController = TextEditingController();
  bool _obscureText = true; // Whether to obscure the password text

  void signInUser() async {
    final response = await PostApiservice().getPost(
      farmerMobileController.text,
      farmerPasswordController.text,
    );
    if (response["status"] == "success") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => signin()));
    } else {
      print("Invalid user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Sign in to your Account"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(.5),
              Colors.white,
            ],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: farmerMobileController,
              decoration: InputDecoration(
                hintText: "Enter Mobile",
                labelText: "Mobile",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: farmerPasswordController,
              obscureText: _obscureText, // Initially hide the password
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggle the password visibility
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: signInUser,
                child: Text("Sign in"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
