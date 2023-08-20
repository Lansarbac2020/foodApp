import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PaymentPage.dart';

// ignore: must_be_immutable
class CartBottomNavBar extends StatefulWidget {
  double subTotal;
  double totalAmount = 0;

  CartBottomNavBar({required this.subTotal, required this.totalAmount});

  @override
  _CartBottomNavBarState createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  @override
  void initState() {
    super.initState();
    updateTotalAmount();
  }

  @override
  void didUpdateWidget(CartBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.subTotal != widget.subTotal) {
      updateTotalAmount();
    }
  }

  void updateTotalAmount() {
    if (widget.subTotal == 0) {
      widget.totalAmount = 0;
    } else {
      widget.totalAmount = widget.subTotal + 5;
    }
  }

  void handleOrderNowClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isOrderEnabled = widget.totalAmount > 5; // Nouvelle ligne ajoutée

    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "TOTAL(Delivery)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 7),
                Text(
                  "\$${(widget.totalAmount + 5).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: isOrderEnabled ? handleOrderNowClick : null,
              style: ElevatedButton.styleFrom(
                primary: isOrderEnabled ? Colors.red : Colors.grey,
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Icon(CupertinoIcons.cart, size: 15),
              label: Text(
                "Order Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
