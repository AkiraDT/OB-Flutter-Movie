import 'package:flutter_riverpod/all.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storageProvider = Provider((ref) => new FlutterSecureStorage());