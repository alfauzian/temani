import 'package:bloc/bloc.dart';


class BeratCounter extends Cubit<int> {
  BeratCounter({required this.berat}):super(berat);

  int berat;


  void tambahBerat() => emit(state + 1);

  void kurangBerat() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }
}

class TinggiCounter extends Cubit<int> {
  TinggiCounter({required this.tinggi}) : super(tinggi);

  int tinggi;

  void tambahTinggi() => emit(state + 1);

  void kurangTinggi() => emit(state - 1);
}

class UsiaCounter extends Cubit<int> {
  UsiaCounter({required this.usia}):super(usia);

  int usia;

  void tambahUsia() => emit(state + 1);

  void kurangUsia() => emit(state - 1);
}