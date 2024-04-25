import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  String? _newPassword;
  bool _showPasswordFields = false;

  Future<void> changePassword() async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(_newPassword!);
      debugPrint('Password changed successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have changed your password successfully'),
        ),
      );
    } catch (error) {
      debugPrint('Failed to change password: $error');
      // Show snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to change password: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User Email: ${user?.email ?? "Unknown"}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            _showPasswordFields
                ? Column(
                    children: [
                      TextFormField(
                        obscureText: true,
                        decoration:
                            InputDecoration(labelText: 'Current Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your current password';
                          }
                          // You may add additional validation logic here
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'New Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new password';
                          }
                          // You may add additional validation logic here
                          return null;
                        },
                        onChanged: (value) {
                          _newPassword = value;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            InputDecoration(labelText: 'Confirm New Password'),
                        validator: (value) {
                          if (value != _newPassword) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            changePassword();
                          }
                        },
                        child: Text('Change Password'),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showPasswordFields = true;
                      });
                    },
                    child: Text('Change Password'),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
