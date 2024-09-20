import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class ZapGridViewPage extends StatefulWidget {
  @override
  _ZapGridViewPageState createState() => _ZapGridViewPageState();
}

class _ZapGridViewPageState extends State<ZapGridViewPage> {
  List<User> friends = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: const Center(child: Text("ToDo")),
    );
  }
}
