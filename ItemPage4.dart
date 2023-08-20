import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ordering_app/Widgets/AppBarWidget.dart';

// ignore: unused_import
import 'ItemBottomNavBar.dart';

class ItemPage4 extends StatefulWidget {
  @override
  _ItemPage1State createState() => _ItemPage1State();
}

class _ItemPage1State extends State<ItemPage4> {
  double subTotal = 20.0;
  int quantity = 0; // Ajoutez une variable pour stocker la quantité.

  // Fonction pour incrémenter la quantité lorsqu'on clique sur le bouton plus.
  void incrementQuantity() {
    setState(() {
      quantity++;
      updateTotalAmount(); // Mettre à jour le total lorsque la quantité change.
    });
  }

  // Fonction pour décrémenter la quantité lorsqu'on clique sur le bouton moins.
  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        updateTotalAmount(); // Mettre à jour le total lorsque la quantité change.
      });
    }
  }

  void updateTotalAmount() {
    if (subTotal == 0) {
      totalAmount = 0;
    } else {
      totalAmount = subTotal * quantity + 5;
    }
  }

  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            AppBarWidget(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                "lib/assets/images/pizza.png",
                height: 300,
                //width: double.infinity,
                // width: 100,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Colors.red),
                              onRatingUpdate: (index) {},
                            ),
                            Text(
                              "\$20",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "HOT PIZZA",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 90,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap:
                                        decrementQuantity, // Utiliser la fonction decrementQuantity ici.
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    "$quantity", // Utiliser la quantité mise à jour ici.
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:
                                        incrementQuantity, // Utiliser la fonction incrementQuantity ici.
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          "Indulge in the sizzling goodness of our hot pizza! Melt-in-your-mouth cheese, perfectly seasoned toppings, and a crispy crust that will leave you craving for more. Treat yourself to the ultimate pizza experience today! ",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    CupertinoIcons.clock,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "30 Minutes ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ItemBottomNavBar(
        subTotal: subTotal,
        totalAmount: totalAmount, // Passer le total ici.
      ),
    );
  }
}
