import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final void Function()? onTap;
  final String url;
  final String title;
  const CardHome(
      {super.key, required this.url, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: 100,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
