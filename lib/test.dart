import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String nickname = '';
  String name = '';
  String gender = '';
  late DateTime birthdate = DateTime.now();
  String password = '';
  String confirmationCode = '';

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
      print('Configuration successful');
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  Future<void> signUpUser({
    required String email,
    required String nickname,
    required String name,
    required String gender,
    required DateTime birthdate,
    required String password,
  }) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        AuthUserAttributeKey.nickname: nickname,
        AuthUserAttributeKey.name: name,
        AuthUserAttributeKey.gender: gender,
        AuthUserAttributeKey.birthdate: DateFormat('yyyy-MM-dd').format(birthdate),
      };

      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      await _handleSignUpResult(result);
      print("Inscription");
      _showConfirmationDialog();
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
          'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  Future<void> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: TextField(
            decoration: InputDecoration(labelText: 'Enter confirmation code'),
            onChanged: (value) {
              setState(() {
                confirmationCode = value;
              });
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                confirmUser(
                  username: email,
                  confirmationCode: confirmationCode,
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Nickname'),
              onChanged: (value) {
                setState(() {
                  nickname = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Gender'),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Birthdate',
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: birthdate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      birthdate = date;
                    });
                  }
                });
              },
              controller: TextEditingController(
                text: birthdate != null ? DateFormat('yyyy-MM-dd').format(birthdate) : null,
              ),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            FilledButton(
              onPressed: () {
                signUpUser(
                  email: email,
                  nickname: nickname,
                  name: name,
                  gender: gender,
                  birthdate: birthdate,
                  password: password,
                );
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FilledButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
