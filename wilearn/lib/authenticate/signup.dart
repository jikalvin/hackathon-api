import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../assets/assets.dart';
import '../assets/routes.dart';
import '../assets/wi_widgets.dart';

class SignUpMode extends StatelessWidget {
  const SignUpMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    ImageAssets.logo_trans,
                    scale: 1.7,
                  ),
                  const Text(
                    "Wilearn",
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40.0,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Signing Up",
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 270,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              GoRouter.of(context).pushNamed(
                                  '/${RouteNames.signup}/info',
                                  params: {'mode': 'student'});
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 20.0))),
                            child:
                                const Text("I want to register as a Student"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              GoRouter.of(context).pushNamed(
                                  '/${RouteNames.signup}/info',
                                  params: {'mode': 'instructor'});
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 20.0))),
                            child: const Text(
                                "I want to register as an Instructor"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.goNamed(RouteNames.signin);
                    },
                    child: const Text("Already have an account"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouteNames.signin);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15)),
                    ),
                    child: const Text("Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key, required this.mode});
  final String mode;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final _formKey = GlobalKey<FormState>();
  String userFirstName = '';
  String userSecondName = '';
  String userEmail = '';
  String usersUserName = '';
  String userPassword = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            margin: const EdgeInsets.all(15.0),
            constraints: const BoxConstraints(
              maxWidth: 650.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      ImageAssets.logo_trans,
                      scale: 1.7,
                    ),
                    const Text(
                      "Wilearn",
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 40.0,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      children: [
                        const Text(
                          "Enter Your Information",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                decoration: buildTextFieldDecoration(
                                  label: "First Name",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    userFirstName = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                decoration: buildTextFieldDecoration(
                                  label: "Second Name",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    userSecondName = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration:
                              buildTextFieldDecoration(label: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              usersUserName = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {
                                context.pop();
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 20)),
                              ),
                              child: const Text(
                                "Back",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.pushNamed('/signup/credentials',
                                      params: {
                                        'username': usersUserName,
                                        'firstname': userFirstName,
                                        'secondname': userSecondName
                                      });
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 20)),
                              ),
                              child: const Text("Continue"),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.goNamed(RouteNames.signin);
                      },
                      child: const Text("Already have an account"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        context.goNamed(RouteNames.signin);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15)),
                      ),
                      child: const Text("Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class SignUpCredentials extends StatefulWidget {
  const SignUpCredentials({
    super.key, required this.username, required this.firstname, required this.secondname,
  });

  final String username;
  final String firstname;
  final String secondname;

  @override
  State<SignUpCredentials> createState() => _SignUpCredentials();
}

class _SignUpCredentials extends State<SignUpCredentials> {
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            margin: const EdgeInsets.all(15.0),
            constraints: const BoxConstraints(
              maxWidth: 650.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      ImageAssets.logo_trans,
                      scale: 1.7,
                    ),
                    const Text(
                      "Wilearn",
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 40.0,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      children: [
                        const Text(
                          "Enter Your Credentials",
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: buildTextFieldDecoration(
                            label: "Enter Email",
                          ),
                          validator: (value) {
                            final regExp =
                                RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
                            if (value!.isEmpty) {
                              return "Please enter an Email or Username";
                            } else if (!regExp.hasMatch(value)) {
                              return "Email is not valid";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userEmail = value!;
                          },
                          onChanged: (value) {
                            setState(() {
                              userEmail = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: buildTextFieldDecoration(
                            label: "Enter Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            } else if (value.length < 8) {
                              return "Password should be atleast 8 characters in length";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userPassword = value!;
                          },
                          onChanged: (value) {
                            setState(() {
                              userPassword = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: buildTextFieldDecoration(
                            label: "Confirm Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            } else if (value != userPassword) {
                              return "Password does not match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            confirmPassword = value!;
                          },
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {
                                context.pop();
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 20)),
                              ),
                              child: const Text(
                                "Back",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.goNamed(RouteNames.dashboard);
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 20)),
                              ),
                              child: const Text("Sign Up"),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.goNamed(RouteNames.signin);
                      },
                      child: const Text("Already have an account"),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                        context.goNamed(RouteNames.signin);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15)),
                      ),
                      child: const Text("Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
