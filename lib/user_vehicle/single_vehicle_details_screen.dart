import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../reusable_widgets/text.dart';

class SingleVehicleDetailsScreen extends StatefulWidget {
  const SingleVehicleDetailsScreen({super.key});

  @override
  State<SingleVehicleDetailsScreen> createState() => _SingleVehicleDetailsScreenState();
}

class _SingleVehicleDetailsScreenState extends State<SingleVehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/guliva_header.png'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CustomText(text: 'Toyota', style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF032B44),
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: (){

                    },
                      child: const Text('...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SegmentedControlScreen extends StatefulWidget {
  const SegmentedControlScreen({super.key});

  @override
  State<SegmentedControlScreen> createState() => _SegmentedControlScreenState();
}

class _SegmentedControlScreenState extends State<SegmentedControlScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  final List<String> _segments = ['Details', 'Trip', 'Insurance'];
  void _onSegmentsTap(int index) {
   setState(() {
     _selectedIndex = index;
   });
   _pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [

              ],
            )
          ],
        ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
