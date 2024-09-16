import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/features/Caisse/infrastucture/models/caisse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CaisseLocalDataSOurce {
  Future<List<CaisseModel>> getCaisse();
  Future<void> saveCaisse(List<CaisseModel> params);
  Future<void> clearCaisse();
}

const cachedCaisse = 'CACHED_CAISSE';

@LazySingleton(as: CaisseLocalDataSOurce)
class CaisseLocalDataSOurceImpl implements CaisseLocalDataSOurce {
  final SharedPreferences sharedPreferences;
  CaisseLocalDataSOurceImpl({required this.sharedPreferences});

  @override
  Future<List<CaisseModel>> getCaisse() {
    final jsonString = sharedPreferences.getString(cachedCaisse);
    if (jsonString != null) {
      return Future.value(caisseModelListFromLocalJson(jsonString));
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<void> saveCaisse(List<CaisseModel> params) {
    return sharedPreferences.setString(
      cachedCaisse,
      caisseModelListToJson(params),
    );
  }

  @override
  Future<void> clearCaisse() async {
    await sharedPreferences.remove(cachedCaisse);
    return;
  }
}
