import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../data/routes.dart';
import '../data/wi_widgets.dart';
import '../services/graphql.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const routeName = '/login';
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _enteredEmailOrUsername = '';
  String _enteredPassword = '';
  bool _isEmailOrUserNameFound = false;
  bool _isPasswordFound = false;
  bool _isLoading = false;
  List<dynamic> _fetchedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          margin: const EdgeInsets.all(35.0),
          constraints: const BoxConstraints(
            maxWidth: 650.0,
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo-transparent.png',
                        scale: 1.7,
                      ),
                      const Text(
                        "E-learn",
                        style: TextStyle(
                          fontFamily: "Pacifico",
                          fontSize: 40.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Sign into account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(),
                  const SizedBox(height: 20.0),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            decoration: buildTextFieldDecoration(
                              label: "Enter Email or Username",
                            ),
                            onChanged: (value) {
                              setState(() => _enteredEmailOrUsername = value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter an Email or Username";
                              } else if (!_isEmailOrUserNameFound &&
                                  _enteredPassword.isNotEmpty) {
                                return "User not found";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              _fetchedUsers
                                      .where((user) =>
                                          user['email'] == value ||
                                          user['username'] == value)
                                      .isNotEmpty
                                  ? setState(
                                      () => _isEmailOrUserNameFound = true)
                                  : setState(
                                      () => _isEmailOrUserNameFound = false);
                            },
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: buildTextFieldDecoration(
                              label: "Enter Password",
                            ),
                            obscureText: true,
                            onChanged: (value) {
                              setState(() => _enteredPassword = value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              } else if (!_isPasswordFound &&
                                  _isEmailOrUserNameFound) {
                                return "Incorrect Password";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _fetchedUsers
                                      .where((user) =>
                                          (user['email'] ==
                                                  _enteredEmailOrUsername ||
                                              user['username'] ==
                                                  _enteredEmailOrUsername) &&
                                          user['password'] == value)
                                      .isNotEmpty
                                  ? setState(() => _isPasswordFound = true)
                                  : setState(() => _isPasswordFound = false);
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.goNamed(RouteNames.dashboard);
                                    // _formKey.currentState!.save();
                                    // fetchUsers();
                                    // if (_formKey.currentState!.validate()) {
                                    //   context.goNamed(RouteNames.dashboard);
                                    //   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    // }
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 20)),
                                  ),
                                  child: const Text("Log In"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(children: <Widget>[
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15)),
                                ),
                                child: const Text(
                                  "Forgotten Password?",
                                  textAlign: TextAlign.center,
                                ),
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
                          context.goNamed(RouteNames.signup);
                        },
                        child: const Text("Don't have an account"),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.goNamed(RouteNames.signup);
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15)),
                        ),
                        child: const Text("Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ));
  }

  void fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    QueryResult queryResult =
        await gqlClient.query(QueryOptions(document: gql("""
            query {
              User {
                username
                email
                password
              }
            }
          """)));

    if (queryResult.hasException) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text(queryResult.exception.toString())));
    }

    setState(() {
      _fetchedUsers = queryResult.data!['User'];
      _isLoading = false;
    });

    //print("$_fetchedUsers: ${_fetchedUsers.runtimeType}");
  }
}
