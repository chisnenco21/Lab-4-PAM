import 'package:flutter/material.dart';
import '../../domain/entities/barbershop.dart';
import '../../domain/usecases/get_barbershops.dart';
import '../widgets/barbershop_card.dart';
import '../widgets/recommended_barbershop_card.dart';

class BarberHomePage extends StatelessWidget {
  final GetBarbershops getBarbershops = GetBarbershops();

  @override
  Widget build(BuildContext context) {
    List<Barbershop> barbershops = getBarbershops();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            _buildHeader(),
            SizedBox(height: 16),
            _buildBanner(),
            SizedBox(height: 16),
            _buildSearchSection(),
            SizedBox(height: 16),
            _buildNearestBarbershopTitle(),
            SizedBox(height: 8),
            _buildBarbershopList(barbershops),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Icon(Icons.location_on, color: Colors.grey[600]),
          SizedBox(width: 8),
          Text(
            "Chișinău",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/fotop.png"),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeader() {
    return Text(
      "Dinu Chisnenco",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Booking Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      Icon(Icons.shopping_cart, size: 24, color: Colors.orange),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                "assets/photo1.png",
                scale: 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search barber's, haircut services...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(Icons.filter_list, color: Colors.grey[600]),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildNearestBarbershopTitle() {
    return Text(
      "Nearest Barbershop",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBarbershopList(List<Barbershop> barbershops) {
    // Separate the recommended barbershop from the rest
    Barbershop? recommendedBarbershop = barbershops.firstWhere(
      (barber) => barber.isRecommended,
      orElse: () => null,
    );

    List<Barbershop> nearestBarbershops =
        barbershops.where((barber) => !barber.isRecommended).toList();

    return Expanded(
      child: ListView(
        children: [
          // Nearest barbershops
          ...nearestBarbershops
              .map((barber) => BarbershopCard(barbershop: barber))
              .toList(),
          SizedBox(height: 16),
          // Most recommended section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Recommended",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text("See All"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Recommended barbershop
          if (recommendedBarbershop != null)
            RecommendedBarbershopCard(barbershop: recommendedBarbershop),
        ],
      ),
    );
  }
}
