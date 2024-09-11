import 'package:dailyzap/helpers/constants/storage_keys.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionToken = (prefs.getString(StorageKeys.sessionToken) ?? "");
    if (sessionToken == "") {
      navigate('/auth');
    } else {
      // setBearer(sessionToken);
      navigate('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
