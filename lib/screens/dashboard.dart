import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:myproj/profile/profile_view.dart';

import 'package:myproj/screens/webview.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AuthUser _user;

  @override
  void initState() {
    super.initState();
    Amplify.Auth.getCurrentUser().then((user) {
      setState(() {
        _user = user;
      });
    }).catchError((error) {
      print((error as AuthException).message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          MaterialButton(
            onPressed: () {
              Amplify.Auth.signOut().then((_) {
                Navigator.pushReplacementNamed(context, '/');
              });
            },
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children:[
          ElevatedButton(
            child: Text("Go to Profile sample"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SalonWebView()),
              );
            },
          ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Upload profile picture"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()),
                );

              },
            )
          ]

        ),
      ),
    );
  }
}
