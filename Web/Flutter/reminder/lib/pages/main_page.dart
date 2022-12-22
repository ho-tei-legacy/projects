// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reminder/pages/auth/auth_page.dart';
import 'package:reminder/pages/database/database.dart';
import 'package:reminder/pages/home_page.dart';
import 'package:reminder/pages/loading_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DatabaseHandler db = DatabaseHandler();
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: Future.wait([db.fetchTodos(), db.fetchUserData()]),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return HomePage();
                } else {
                  return LoadingPage();
                }
              },
            );
          } else {
            if (db.getData().isNotEmpty) {
              db.uploadCacheToDB();
            }
            return AuthPage();
          }
        },
      ),
    );
  }
}
