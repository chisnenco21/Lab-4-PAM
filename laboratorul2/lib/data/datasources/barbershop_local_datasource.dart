import '../models/barbershop_model.dart';

abstract class BarbershopLocalDataSource {
  List<BarbershopModel> getBarbershopData();
}

class BarbershopLocalDataSourceImpl implements BarbershopLocalDataSource {
  @override
  List<BarbershopModel> getBarbershopData() {
    return [
      BarbershopModel(
        title: "Alana Barbershop – Haircut massage & Spa",
        distance: "Banguntapan (5km)",
        rating: 4.5,
        imageUrl: "assets/foto3.jpeg",
      ),
      // Add other barbershops similarly
    ];
  }
}
