import 'package:flutter/material.dart';
import 'package:twitter_ui/services/mongoConnect.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        
           Padding(
             padding: EdgeInsets.all(width * 0.05),
             child: TextFormField(
              controller: fnameController,
              decoration: InputDecoration(
                hintText: 'First Name',
                border: const OutlineInputBorder(),
                contentPadding: EdgeInsets.all(width * 0.05),
              ),
                     ),
           ),
           Padding(
             padding: EdgeInsets.all(width * 0.05),
             child: TextFormField(
              controller: lnameController,
              decoration: InputDecoration(
                hintText: 'Last Name',
                 border: const OutlineInputBorder(),
                contentPadding: EdgeInsets.all(width * 0.05),
              ),
                     ),
           ),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                 border: const OutlineInputBorder(),
                contentPadding: EdgeInsets.all(width * 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: TextFormField(
              controller: passwordController,
              decoration:  InputDecoration(
                hintText: 'Password',
                 border: const OutlineInputBorder(),
                contentPadding: EdgeInsets.all(width * 0.05),
              ),
            ),
          ),
           Padding(
             padding:  EdgeInsets.all(width * 0.05),
             child: TextFormField(
              controller: confirmPasswordController,
              decoration:  InputDecoration(
                hintText: 'Confirm Password',
                 border: const OutlineInputBorder(),
                contentPadding: EdgeInsets.all(width * 0.05),
              ),
                     ),
           ),
          ElevatedButton(
            onPressed: (){
              MongoDatabase.signup(fnameController.text, lnameController.text, usernameController.text, passwordController.text, confirmPasswordController.text);
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}