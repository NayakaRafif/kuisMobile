import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';
String username = "";
String password = "";
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 150.0,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: TextStyle(color: Colors.blueGrey),
                      onChanged: (value){
                        username = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(Icons.person, color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: TextStyle(color: Colors.blueGrey),
                      obscureText: true,
                      onChanged: (value){
                        password = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                       if(username == "nay" && password == "123" ){
                         Navigator.pushReplacement(context, 
                         MaterialPageRoute(builder: (context) => HomePage()),
                         );
                       }else{
                         SnackBar snackbar = SnackBar(
                         content: Text("Username atau Password salah"),
                         backgroundColor: Colors.red,
                       );
                       ScaffoldMessenger.of(context).showSnackBar(snackbar);
                       }
                       
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
