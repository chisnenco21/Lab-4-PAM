import '../entities/barbershop.dart';

abstract class BarbershopRepository {
  List<Barbershop> fetchBarbershops();
}
