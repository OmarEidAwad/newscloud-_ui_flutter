import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;
  bool _darkMode = false;
  double _fontSize = 16.0;
  String complaint = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Color.fromARGB(255, 235, 115, 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'General Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),

            SwitchListTile(
              title: Text('Enable Dark Mode'),
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),

            SizedBox(height: 16),
            Text(
              'Font Size',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              divisions: 20,
              label: _fontSize.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),

            // Username Text Field
            SizedBox(height: 16),
            Text(
              '*Any Complaint !',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your complaint',
              ),
              onChanged: (String value) {
                setState(() {
                  complaint = value;
                });
              },
            ),

            // Save Button
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text('Send',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color.fromARGB(255, 235, 115, 24)),
            ),
          ],
        ),
      ),
    );
  }
}
