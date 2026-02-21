import 'package:flutter/material.dart';
import 'package:navigation_app/data/api/api_service.dart';
import 'package:navigation_app/data/model/tourism_detail_response.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/provider/is_bookmark_provider.dart';
import 'package:navigation_app/widgets/bookmark_button.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.index});

  final int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<TourismDetailResponse> _futureTourismDetailResponse;

  @override
  void initState() {
    super.initState();
    _futureTourismDetailResponse = ApiService().getTourismDetail(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          ChangeNotifierProvider(create: (context) => IsBookmarkProvider(), child: BookmarkButton(widget.index)),
        ],
      ),

      body: FutureBuilder(
        future: _futureTourismDetailResponse,
        builder: (BuildContext context, AsyncSnapshot<TourismDetailResponse> snapshot) {
          final state = snapshot.connectionState;
          switch (state) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text('No data available'));
              }

              final data = snapshot.data!.place;
              return Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    Image.network(data.image, fit: BoxFit.cover),
                    const SizedBox.square(dimension: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text(data.address, style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite),
                            const SizedBox.square(dimension: 4),
                            Text(data.like.toString()),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox.square(dimension: 16),
                    Text(data.description),
                  ],
                ),
              );
          }
        },
      ),
      // body: Padding(
      //   padding: EdgeInsetsGeometry.all(20),
      //   child: Column(
      //     children: [
      //       Image.network(widget.data.image, fit: BoxFit.cover),
      //       const SizedBox.square(dimension: 16),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Expanded(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(widget.data.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //                 Text(widget.data.address, style: TextStyle(fontSize: 12)),
      //               ],
      //             ),
      //           ),
      //           Row(
      //             children: [
      //               const Icon(Icons.favorite),
      //               const SizedBox.square(dimension: 4),
      //               Text(widget.data.like.toString()),
      //             ],
      //           ),
      //         ],
      //       ),
      //       const SizedBox.square(dimension: 16),
      //       Text(widget.data.description),
      //     ],
      //   ),
      // ),
    );
  }
}
