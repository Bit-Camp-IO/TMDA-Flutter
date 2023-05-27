import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmda/core/error/exception.dart';

abstract class LocalDataSource {
  Future<void> storeSessionId(String sessionKey);
  Future<String> retrieveSessionId();
}

class LocalDataSourceImpl extends LocalDataSource {
  final secureStorage = const FlutterSecureStorage();
  @override
  Future<String> retrieveSessionId() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      final sessionKey = encryptedBox.get('session_key');
      if (sessionKey == null) {
        throw CacheException();
      } else {
        return sessionKey;
      }
  }

  @override
  Future<void> storeSessionId(String sessionKey) async {
    final encryptionKeyString = await secureStorage.read(key: 'key');
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'key',
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);
    print('Encryption key Uint8List: $encryptionKeyUint8List');
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    encryptedBox.put('session_key', sessionKey);
    print('Stored Key>>>>>${encryptedBox.get('session_key')}');
  }
}
