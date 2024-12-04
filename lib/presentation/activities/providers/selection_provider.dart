import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTimeDateProvider =
    StateProvider.autoDispose<String?>((ref) => null);
