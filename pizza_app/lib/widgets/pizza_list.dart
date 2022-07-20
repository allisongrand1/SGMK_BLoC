import 'package:flutter/material.dart';
import 'package:pizza_app/models/pizza.dart';

PizzaList(BuildContext context, Pizza pizza) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        shadowColor: const Color.fromRGBO(90, 108, 234, 0.08).withOpacity(0.08),
        elevation: 25,
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        pizza.image,
                        width: 64,
                        height: 64,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          pizza.title!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    '\$${pizza.amount}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: const Color(0xFFF43F5E), fontSize: 26),
                  ),
                ),
              ],
            ))),
  );
}
