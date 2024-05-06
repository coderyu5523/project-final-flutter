import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

final CheckedBoxProvider = StateProvider<bool>((ref) => false);
