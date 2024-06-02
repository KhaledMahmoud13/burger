import 'package:burger_shop/controller/burger_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Consumer<BurgerController>(
            builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.cartList.length,
              itemBuilder: (context, index) => Card(
                elevation: 0,
                color: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/${value.cartList[index].image}',
                        width: 80,
                        height: 80,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.cartList[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '\$${value.cartList[index].price}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => value.decreaseQuantityOfItem(
                                          value.cartList[index]),
                                      child: const Icon(
                                        Icons.arrow_circle_down,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      '${value.cartList[index].quantity}',
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    InkWell(
                                      onTap: () => value.increaseQuantityOfItem(
                                          value.cartList[index]),
                                      child: const Icon(
                                        Icons.arrow_circle_up,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => value
                                      .removeFromCart(value.cartList[index]),
                                  child: const Icon(
                                    CupertinoIcons.trash_circle,
                                    size: 30,
                                    color: Colors.white,
                                  ),
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
          ),
        ],
      ),
    );
  }
}
