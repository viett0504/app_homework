import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  CartBody({super.key, required this.item});
  var item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: const Color(0xDFDFDFDF),
          borderRadius: BorderRadius.circular(7)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Icon(Icons.delete_forever, color: Colors.black26, size: 30,),
        ],
      ),
    );
  }
}