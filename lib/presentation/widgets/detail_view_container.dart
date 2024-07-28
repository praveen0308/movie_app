import 'package:flutter/material.dart';

class DetailViewContainer extends StatelessWidget {
  const DetailViewContainer({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(value,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
          Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}
