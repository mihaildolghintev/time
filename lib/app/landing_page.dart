import 'package:flutter/material.dart';
import 'package:time/app/home_page.dart';
import 'package:time/app/sign_in/sign_in_page.dart';
import 'package:time/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LocalUser _user;

  void _updateUser(LocalUser user) {
    setState(() {
      _user = user;
    });
  }

  void _signOut() {
    setState(() {
      _user = null;
    });
  }

  Future<void> _checkCurrentUser() async {
    LocalUser user = await widget.auth.currentUser();
    _updateUser(user);
  }

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: _updateUser,
        auth: widget.auth,
      );
    }
    return HomePage(auth: widget.auth, onSignOut: _signOut);
  }
}
