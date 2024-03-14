import 'package:flutter/material.dart';
import 'package:agri_app_frontend/pages/signin.dart';
import 'package:agri_app_frontend/pages/signup.dart';

class home extends StatefulWidget {
  const home({Key? key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white.withOpacity(0.6), // Change color to light green
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Office Address:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Santhanpara Grama panchayat, Devikulam Block Pachayath, Santhanpara, Idukki, Kerala, India",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "Landline: 04868-247366",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "Email: kbsanthanpara@gmail.com",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),



      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(.7),
              Colors.white.withOpacity(.5)
            ],
          ),
        ),
        width: double.infinity,
        height: 800,
        child: Card(
          color: Colors.white.withOpacity(0.6), // Change color to light green
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome', // Add your welcome text here
                  style: TextStyle(
                    fontSize: 24, // Adjust font size as needed
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20), // Add some space between welcome text and logo
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    "https://tse1.explicit.bing.net/th?id=OIP.I96l6DGHKVOI8gegDtD3kgHaFE&pid=Api&P=0&h=180",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: Text("Sign in"),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => reg()),
                      );
                    },
                    child: Text("Create new account"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
