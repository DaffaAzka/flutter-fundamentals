import 'package:flutter/material.dart';
import 'package:navigation_app/data/api/api_service.dart';
import 'package:navigation_app/data/model/tourism_list_response.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/widgets/tourism_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Tourism List")),
//       body: ListView.builder(
//         itemCount: tourismList.length,
//         itemBuilder: (context, index) {
//           final tourism = tourismList[index];
//           return TourismCard(tourism: tourism);
//         },
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<TourismListResponse> _futureTourismResponse;

  @override
  void initState() {
    super.initState();
    _futureTourismResponse = ApiService().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tourism List")),
      body: FutureBuilder(
        future: _futureTourismResponse,
        builder: (BuildContext context, AsyncSnapshot<TourismListResponse> snapshot) {
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
              final listTourism = snapshot.data!.places;
              return ListView.builder(
                itemCount: listTourism.length,
                itemBuilder: (context, index) {
                  final tourism = listTourism[index];
                  return TourismCard(tourism: tourism);
                },
              );
          }
        },
      ),
    );
  }
}
