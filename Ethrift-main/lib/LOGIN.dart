import 'package:flutter/material.dart';
import 'HOMEPAGE.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250, //Tool bar height
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            padding: const EdgeInsets.only(top: 100, left: 30),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop('/Sign_in');
            },
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff7FECC2),
                Color(0xff268A63),
                Color(0xff52A585),
              ],
              stops: [0.0, 0.0, 0.2],
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: const Text(
                    'WELCOME BACK!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  child: const Text(
                    'Lets get you signed in!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xffC65454)),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            SizedBox(
              width: 320.0,
              height: 51.0,
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff000000),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Register');
                },
                child: const Text(
                  'Don’t have any account? Sign Up.',
                  style: TextStyle(color: Color(0xff4364A4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
