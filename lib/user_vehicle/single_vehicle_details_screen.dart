import 'package:flutter/material.dart';
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
          const Expanded(
              child: SegmentedControlScreen(),
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
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            _buildCustomSegmentedControl(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: PageView(
                controller: _pageController,
                  onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  },
                  children: const [
                    DetailsScreen(),
                    TripsScreen(),
                    InsuranceScreen(),
                  ],
                )
            )
          ],
        );
    //);
  }
  Widget _buildCustomSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildSegments('Details', 0),
          _buildSegments('Tips', 1),
          _buildSegments('Insurance', 2),
        ],
      ),
    );
  }
  Widget _buildSegments(String label, int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: Text(label, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: _selectedIndex == index ? Colors.black : Colors.grey,
            ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        if (_selectedIndex == index)
          Container(
            height: 2,
            width: label.length * 10.0,
            color: const Color(0xFF032B44),
          )
      ],
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
