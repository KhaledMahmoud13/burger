import 'package:burger_shop/controller/burger_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late BurgerController controller;
  @override
  void initState() {
    super.initState();
    controller = Provider.of<BurgerController>(context, listen: false);
    Future.delayed(
      Duration(seconds: 1),
      () => controller.changeOpacity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.sort,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            'Hot & Fast Food',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Delievers on Time',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.categories.length,
                (index) => Row(
                  children: [
                    InkWell(
                      onTap: () => controller.changeCategory(index),
                      child: Consumer<BurgerController>(
                        builder: (context, value, child) => Text(
                          controller.categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: value.selectedCategory == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.burgerList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3.1,
            ),
            itemBuilder: (context, index) {
              return Consumer<BurgerController>(
                builder: (context, value, child) => AnimatedOpacity(
                  opacity: value.opacity,
                  duration: Duration(milliseconds: 900 * index),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: value.burgerList[index],
                    ),
                    child: Card(
                      elevation: 0,
                      color: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/${controller.burgerList[index].image}',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.burgerList[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.burgerList[index].subTitle,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$${controller.burgerList[index].price}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        elevation: 0,
        onTap: (value) {
          if (value == 2) {
            Navigator.pushNamed(context, '/cart');
          }
        },
        unselectedItemColor: Colors.white,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.2),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
