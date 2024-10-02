import 'package:flutter/material.dart';
import '../reusable_widgets/button.dart';
import '../reusable_widgets/text.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
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
                  CustomText(text: 'Vehicles/Passengers', style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF032B44),
                    fontWeight: FontWeight.w500,
                  ),
                  ),
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

  void _onSegmentTap(int index) {
     setState(() {
       _selectedIndex = index;
     });
     _pageController.jumpToPage(index);
  }

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
                VehiclesScreen(),
                PassengersScreen(),
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
          _buildSegments('Vehicle', 0),
          _buildSegments('Passengers', 1),
        ],
      ),
    );
  }
  Widget _buildSegments(String label, int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _onSegmentTap(index);
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

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomText(text: 'Vehicles', style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF032B44),
              fontWeight: FontWeight.w400,
            ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: CustomButton(
              buttonText: 'ADD VEHICLE', onPressed: () {  }, color: const Color(0xFF032B44), borderRadius: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomText(text: 'Passengers', style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF032B44),
              fontWeight: FontWeight.w400,
            ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: CustomButton(
              buttonText: 'ADD VEHICLE', onPressed: () {  }, color: const Color(0xFF032B44), borderRadius: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}

