//import 'package:clippy_flutter/message.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _problemType = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Create an email message
      final message = Message()
        ..from = Address(_email) // User's email
        ..recipients.add('info.lansardevflutter@gmail.com')
        ..subject = 'Contact Form Submission'
        ..text = '''
          Name: $_name
          Email: $_email

          Problem Type: $_problemType
        ''';
      print('Email message created');

      // Use your SMTP credentials here
      final smtpServer =
          gmail('info.lansardevflutter@gmail.com', 'ltxieukmhfclpaiq');

      try {
        print('Sending email...');
        // Send the email
        if (mounted) {
          final sendReport = await send(message, smtpServer);
          print('Email sent: ${sendReport.toString()}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Message sent successfully !'),
              duration:
                  Duration(seconds: 3), // Optional duration for the snackbar
            ),
          );

          // Clear form fields
          _formKey.currentState!.reset();
        }
      } catch (error) {
        print('Error sending email: $error');
      }

      if (mounted) {
        // Navigate back to the previous page
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Contact Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more email validation logic here if needed
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Describe your problem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe your problem ';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _problemType = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
