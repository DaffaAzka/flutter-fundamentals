import 'package:flutter/material.dart';
import 'package:navigation_app/data/model/tourism.dart';

class TourismCard extends StatelessWidget {
  final Tourism tourism;

  const TourismCard({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: tourism.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 80, minHeight: 80, maxWidth: 120, minWidth: 120),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
                child: Image.network(tourism.image, width: 120, height: 80, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(tourism.name, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.map, color: Colors.black, size: 16),
                      Text(tourism.address, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.favorite, color: Colors.pink, size: 16),
                      Text(tourism.like.toString(), overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
