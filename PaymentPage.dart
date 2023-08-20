import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:ordering_app/Pages/CartPage.dart'; // Importer le widget CartPage que vous avez défini

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  String? _cardNumberError;
  String? _expiryDateError;
  String? _cvvError;

  bool _validateForm() {
    setState(() {
      _cardNumberError = null;
      _expiryDateError = null;
      _cvvError = null;

      if (_cardNumberController.text.isEmpty) {
        _cardNumberError = 'Please enter card number';
      } else if (_cardNumberController.text.length != 16) {
        _cardNumberError = 'Card number should be 16 digits';
      }

      if (_expiryDateController.text.isEmpty) {
        _expiryDateError = 'Please enter expiry date';
      }

      if (_cvvController.text.isEmpty) {
        _cvvError = 'Please enter CVV';
      } else if (_cvvController.text.length != 3) {
        _cvvError = 'CVV should be 3 digits';
      }
    });

    return _cardNumberError == null &&
        _expiryDateError == null &&
        _cvvError == null;
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Thank you for your purchase!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/cart', // Replace '/cart' with the route name for CartPage
                (route) => false, // Pop all routes until CartPage is reached
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Payment'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.credit_card,
                size: 80,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                'Payment with Credit Card',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  errorText: _cardNumberError,
                ),
                keyboardType: TextInputType.number,
                maxLength: 16,
              ),
              TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  errorText: _expiryDateError,
                ),
              ),
              TextField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  errorText: _cvvError,
                ),
                keyboardType: TextInputType.number,
                maxLength: 3,
                onChanged: (value) {
                  if (value.contains(RegExp(r'[^\d]'))) {
                    _cvvController.text =
                        value.replaceAll(RegExp(r'[^\d]'), '');
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateForm()) {
                    _showPaymentSuccessDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'Pay Now',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
