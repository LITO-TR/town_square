import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:town_square/infrastructure/services/key_value_storage_service.dart';
import 'package:town_square/infrastructure/services/key_value_storege_service_impl.dart';

final keyValueStorageProvider = Provider<KeyValueStorageService>((ref) {
  return KeyValueStorageServiceImpl();
});
