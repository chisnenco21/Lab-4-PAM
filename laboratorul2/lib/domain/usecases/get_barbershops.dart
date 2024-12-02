import '../entities/barbershop.dart';
import '../repositories/barbershop_repository.dart';
import '../../data/repositories/barbershop_repository_impl.dart';

class GetBarbershops {
  final BarbershopRepository repository = BarbershopRepositoryImpl();

  List<Barbershop> call() {
    return repository.fetchBarbershops();
  }
}
