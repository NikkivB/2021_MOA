import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/shared_prefs_utils.dart';

class UserData extends StatefulWidget {
  UserData({this.clicks = 0});
  int clicks;

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();

  void readUserData() {
    MySharedPreferences.instance
        .getStringValue("birthdate")
        .then((value) => setState(() {
      if (value != null) {
        birthdateController.text = value;
      }
    }));
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
      if (value != null) {
        nameController.text = value;
      }
    }));
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
      if (value != null) {
        emailController.text = value;
      }
    }));
  }

  String birthdate = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    readUserData();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User data'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your name',
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your emailaddress',
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(birthdate) ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  birthdateController.text = date.toString().substring(0, 10);
                },
                controller: birthdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your birthdate',
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Number of clicks: ${widget.clicks}'),
              IconButton(
                onPressed: () {
                  MySharedPreferences.instance.setStringValue("birthdate", birthdateController.text);
                  MySharedPreferences.instance.setStringValue("name", nameController.text);
                  MySharedPreferences.instance.setStringValue("email", emailController.text);
                },
                icon: Icon(Icons.save),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.clicks = 0;
                    MySharedPreferences.instance
                      .setIntegerValue('clicks', widget.clicks);
                  });
                },
                icon: Icon(Icons.clear),
              )
            ],
          ),
        ),
      ),
    );
  }
}
