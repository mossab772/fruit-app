import 'package:flutter/material.dart';

class Productitms extends StatelessWidget {
  const Productitms({
    super.key,
    required this.image,
    required this.name,
    required this.rate,
    required this.rateCount,
    required this.price,
    this.onTap, required this.icon,
  });
  final String image;
  final String name;
  final String rate;
  final String rateCount;
  final String price;
  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 120,
                  height: 125,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(image, width: 120,fit: BoxFit.cover,),
                ),

                Positioned(
                  bottom: 6,
                  right: 5,
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: icon,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  width: 130,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/fruits/star.png", width: 18),
                    SizedBox(width: 5),
                    Text(
                      "$rate ($rateCount)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "\$ $price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
