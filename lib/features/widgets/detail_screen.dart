import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required void Function() onClose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.85),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mogli's Cup",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.white70),
                              SizedBox(width: 4),
                              Text(
                                '200',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet et vel sit amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed diam semper mi hendrerit. Id aliquet quis quam.',
                        style: TextStyle(color: Colors.white60, fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'A\$ 8.99',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.restaurant_menu,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Ingredients',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star_half, color: Colors.amber),
                              SizedBox(width: 4),
                              Text(
                                '4.0',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          ChoiceChip(label: Text('Small'), selected: false),

                          ChoiceChip(label: Text('Medium'), selected: false),

                          ChoiceChip(label: Text('Large'), selected: true),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFDA6BFC), Color(0xFF6D8CFF)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Add to order for A\$ 8.99',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset('assets/images/cupcake_cat.png', height: 350),
          ),
        ),
      ],
    );
  }
}

void showProductDetail(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) =>
        ProductDetailScreen(onClose: () => Navigator.of(context).pop()),
  );
}
