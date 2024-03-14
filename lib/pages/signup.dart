import 'package:agri_app_frontend/services/postservices.dart';
import 'package:flutter/material.dart';

class reg extends StatefulWidget {
  const reg({super.key});

  @override
  State<reg> createState() => _regState();
}

class _regState extends State<reg> {
  final TextEditingController farmerName = TextEditingController();
  final TextEditingController farmerMobile = TextEditingController();
  final TextEditingController farmerPassword = TextEditingController();
  final TextEditingController farmerConfirmPassword = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  void sentbutton() async {
    if (farmerPassword.text != farmerConfirmPassword.text) {
      // Passwords don't match
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Passwords do not match.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      final response = await PostApiservice().sentData(
        farmerName.text,
        farmerMobile.text,
        farmerPassword.text,
      );

      if (response['status'] == 'success') {
        // Account creation successful
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Account created successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Account creation failed
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create account. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Create New Account"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.withOpacity(.5), Colors.white],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: farmerName,
              decoration: InputDecoration(
                hintText: "Enter Farmer Name",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: farmerMobile,
              decoration: InputDecoration(
                hintText: "Enter Mobile Number",
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: farmerPassword,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                  child: Icon(
                    _isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: farmerConfirmPassword,
              obscureText: _isObscureConfirmPassword,
              decoration: InputDecoration(
                hintText: "Re-enter Password",
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscureConfirmPassword =
                      !_isObscureConfirmPassword;
                    });
                  },
                  child: Icon(
                    _isObscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
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
                onPressed: sentbutton,
                child: Text("Create"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
