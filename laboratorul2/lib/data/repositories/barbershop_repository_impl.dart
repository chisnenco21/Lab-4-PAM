import '../../domain/entities/barbershop.dart';
import '../../domain/repositories/barbershop_repository.dart';
import '../datasources/barbershop_local_datasource.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final BarbershopLocalDataSource localDataSource =
      BarbershopLocalDataSourceImpl();

  @override
  List<Barbershop> fetchBarbershops() {
    return localDataSource.getBarbershopData();
  }
}
