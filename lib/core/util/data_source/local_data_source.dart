import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmda/core/error/exception.dart';

abstract class LocalDataSource {
  Future<void> storeSessionId(String sessionKey);
  Future<String> retrieveSessionId();
  Future<void> deleteSessionId();
}

class LocalDataSourceImpl extends LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  @override
  Future<String> retrieveSessionId() async {
    final encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey != null) {
      final encryptionKeyUint8List = base64Url.decode(encryptionKey);
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      final sessionKey = encryptedBox.get('session_key');
      debugPrint('Session key Retrieved >>> $sessionKey');
      return sessionKey;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> storeSessionId(String sessionKey) async {
    final encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey == null) {
      final generateEncryptionKey = Hive.generateSecureKey();
      await secureStorage.write(
          key: 'key', value: base64UrlEncode(generateEncryptionKey));
      final newEncryptionKey = await secureStorage.read(key: 'key');
      final encryptionKeyUint8List = base64Url.decode(newEncryptionKey!);
      debugPrint('Encryption key Uint8List: $encryptionKeyUint8List');
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      encryptedBox.put('session_key', sessionKey);
      debugPrint('Stored Key>>>>>${encryptedBox.get('session_key')}');
    } else {
      final encryptionKeyUint8List = base64Url.decode(encryptionKey);
      debugPrint('Encryption key Uint8List: $encryptionKeyUint8List');
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      encryptedBox.put('session_key', sessionKey);
      debugPrint('Stored Key>>>>>${encryptedBox.get('session_key')}');
    }
  }

  @override
  Future<void> deleteSessionId() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    try {
      encryptedBox.delete('session_key');
      debugPrint("key deleted >>>> Logged Out");
    } on Exception {
      debugPrint("Error >>>> Logged Out Failed");
      throw const CacheException();
    }
  }
}
