import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String api;
  final String desc;
  final String auth;
  final String https;
  final String cors;
  final String link;
  final String category;

  const CustomContainer({
    Key? key,
    required this.api,
    required this.desc,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[400],
        borderRadius: BorderRadius.circular(14.0),
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(api),
                Text(cors),
              ],
            ),
          ),

          //
          const Divider(
            thickness: 1.0,
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Text(desc),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Text(link),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Text(auth),
          ),

          //
          const Divider(
            thickness: 1.0,
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(https),
                Text(category),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
