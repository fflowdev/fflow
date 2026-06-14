import 'package:drift/drift.dart';
import 'package:fflow/core/settings/data/app_settings_dao.dart';
import 'package:fflow/core/settings/domain/app_settings_kv.dart';
import 'package:fflow/core/settings/domain/app_settings_table.dart';
import 'package:fflow/core/storage/storage.dart';

class AppSettingsRepository
    extends
        DatabaseRepository<
          AppSettingsDao,
          AppSettingsTable,
          AppSettingsData,
          AppSettingsKV<Object>
        > {
  AppSettingsRepository()
    : super(
        dao: AppSettingsDao(),
        toDataObject: (kv) => AppSettingsData(
          key: kv.key,
          value: DriftAny(kv.value),
        ),
        toBusinessObject: (data) => AppSettingsKV(
          key: data.key,
          value: data.value,
        ),
      );

  Future<DataT?> getValue<DataT extends Object>(String key) async {
    final kv = await dao.selectByKey(key);
    if (kv != null) {
      return kv.value.readAs<DataT>(DriftSqlType.forType(), dao.typeMapping);
    } else {
      return null;
    }
  }

  Future<void> setValue<DataT extends Object?>(String key, DataT value) {
    if (value == null) return dao.deleteByKey(key);
    return dao.setByKey(key, DriftAny(value));
  }
}
