import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(PetServiceApp());
}

class PetServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BottomNavController(),
    );
  }
}

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectedIndex = 1; // Pet Service is the 2nd tab (index 1)

  final List<Widget> _pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 20))),
    ServicePage(), // Pet Service
    Center(child: Text('Appointments Page', style: TextStyle(fontSize: 20))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Services'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181C2D),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: _navItems,
      ),
    );
  }
}

class ServicePage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Grooming',
      'rating': 4.5,
      'comment': 'Excellent grooming service! My dog loved it.',
      'icon': Icons.cut,
      'color': Color(0xFFD5C0DE),
    },
    {
      'name': 'Training',
      'rating': 4.8,
      'comment': 'Great training sessions, highly recommended!',
      'icon': Icons.school,
      'color': Color(0xFFDBEBD8),
    },
    {
      'name': 'Vet Consultation',
      'rating': 4.6,
      'comment': 'The vet was very professional and caring.',
      'icon': Icons.local_hospital,
      'color': Color(0xFFBFE3E5),
    },
    {
      'name': 'Pet Sitting',
      'rating': 4.3,
      'comment': 'Reliable and loving pet sitters!',
      'icon': Icons.home,
      'color': Color(0xFFF1BFC9),
    },
    {
      'name': 'Pet Walking',
      'rating': 4.7,
      'comment': 'Very friendly and punctual dog walkers!',
      'icon': Icons.directions_walk,
      'color': Color(0xFFEDC4AA),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181C2D),
      appBar: AppBar(
        title: Text('Pet Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return ServiceCard(
              name: service['name'],
              rating: service['rating'],
              comment: service['comment'],
              icon: service['icon'],
              color: service['color'],
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final double rating;
  final String comment;
  final IconData icon;
  final Color color;

  ServiceCard({
    required this.name,
    required this.rating,
    required this.comment,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.1),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.3),
              radius: 30,
              child: Icon(icon, size: 35, color: color),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 5),
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(height: 5),
                  Text('"$comment"', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[400])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
