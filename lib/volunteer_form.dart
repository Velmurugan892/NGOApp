import 'package:flutter/material.dart';

class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Volunteer Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Join as Volunteer", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (val) => name = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                onChanged: (val) => phone = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onChanged: (val) => city = val,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // You can also validate or send data to API here
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Submitted"),
                      content: Text("Thank you, $name!"),
                    ),
                  );
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
