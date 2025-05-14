import 'package:flutter/material.dart';
import 'LOGIN.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200, // Tool bar height
          leading: Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: const EdgeInsets.only(top: 70, left: 30),
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white), // Set arrow color to white
              onPressed: () {
                Navigator.of(context).pop('/Register');
              },
            ),
          ),
          flexibleSpace: Container(
            // Tool Bar decoration
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff7FECC2),
                Color(0xff268A63),
                Color(0xff52A585),
              ], stops: [
                0.0,
                0.0,
                0.2
              ]),
            ),
          ),
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0), // Add padding to position the text
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 90),
                    child: const Text(
                      'Create Account!',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Let’s get you Registered!!',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ), // Align content to bottom left
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: 320.0, // Button width
                  height: 51.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Sign_in');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff000000)),
                    child: const Text('Register',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 20)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sign_in()));
                    },
                    child: const Text(
                      'Already have an account? Sign In.',
                      style: TextStyle(color: Color(0xff4364A4)),
                    ),
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
