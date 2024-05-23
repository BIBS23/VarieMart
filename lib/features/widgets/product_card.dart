import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.network(
              image,
              width: 130,
              height: 100,
            ),
             const SizedBox(height: 10),
            Text(title,style: const TextStyle(overflow: TextOverflow.ellipsis),),
            
            const SizedBox(height: 10),
            Text("₹ $price",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
