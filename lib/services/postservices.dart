import 'dart:convert';
import 'package:agri_app_frontend/models/postmodel.dart';
import 'package:http/http.dart' as http;
class PostApiservice
{
  Future<dynamic> sentData(
      String name,
      String mobile,
      String password)

  async{
    var client=http.Client();
    var apiurl=Uri.parse("http://10.0.20.170:3001/farmer/signup");
    var response=await client.post(apiurl,
        headers: <String,String>{
          "Content-Type":"application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{


          "Name": name,
          "Mobile": mobile,
          "password": password,


        })


    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else{
      throw Exception("failure");
    }

  }

  Future <dynamic> getPost(String phonenumber,String password) async{
    var Client=http.Client();
    var apiurl=Uri.parse("http://10.0.20.170:3001/farmer/signin");
    var response=await Client.post(apiurl,
    headers: <String,String>
    {
      "Content-Type":"application/json;charset=UTF-8"
    },
      body:jsonEncode(<String,String>{
        "Mobile":phonenumber,
        "password":password
      })
    );

    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else{
      return[];
    }
  }
}