import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('FAQ'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('How can I contact customer support?'),
            subtitle: GestureDetector(
              onTap: () => _launchEmail('lansarbacoro@gmail.com'),
              child: Text(
                'Email: lansarbacoro@gmail.com',
                style: TextStyle(
                  color: Colors.blue, // Make the email link appear in blue
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),

          ListTile(
            title: Text('How do I place an order ?'),
            subtitle: Text(
                'To place an order, simply browse the menu, select the items you want, and add them to your cart. Proceed to checkout and follow the prompts to complete your order.'),
          ),
          ListTile(
            title: Text('What payment methods are accepted?'),
            subtitle: Text(
                'We accept major credit cards, debit cards, and digital payment options like Apple Pay and Google Pay.'),
          ),
          ListTile(
            title: Text('Is my credit card information secure?'),
            subtitle: Text(
                'Yes, your credit card information is encrypted and securely processed. We prioritize the safety of your data.'),
          ),
          ListTile(
            title: Text('How long does delivery usually take?'),
            subtitle: Text(
                'Delivery times vary depending on your location and order volume. You will receive an estimated delivery time during checkout'),
          ),
          ListTile(
            title: Text('How do I create an account?'),
            subtitle: Text(
                'Tap on the "MY ACCOUNT " button and provide your email , name and photo(if you want ). You will receive a confirmation email to verify your account.'),
          ),
          ListTile(
            title: Text('How do I customize my order?'),
            subtitle: Text(
                'You can customize your order by tapping on an item and selecting your preferred options, such as toppings or sides.'),
          ),
          ListTile(
              title: Text('How is my personal information used?'),
              subtitle: Text(
                  'You can reach our customer support team through the "Contact Us" section of the app or by emailing support@lansarfoodordering.com.')),
          ListTile(
              title: Text('How is my personal information used?'),
              subtitle: Text(
                  'We use your personal information solely for order processing, delivery, and improving your experience. Your data is not shared with third parties')),
          // Add more FAQ items here
        ],
      ),
    );
  }
}

Future<void> _launchEmail(String emailAddress) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );
  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    throw 'Could not launch email';
  }
}
