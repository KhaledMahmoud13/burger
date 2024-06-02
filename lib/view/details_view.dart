import 'package:burger_shop/controller/burger_controller.dart';
import 'package:burger_shop/model/burger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Burger args = ModalRoute.of(context)?.settings.arguments as Burger;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Image.asset('assets/${args.image}'),
          SizedBox(height: 25),
          Text(
            args.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 20),
          Text(
            args.description,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$${args.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2.5,
                height: 60,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                onPressed: () {
                  Provider.of<BurgerController>(context, listen: false)
                      .addToCart(args);
                },
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
