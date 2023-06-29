import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';

abstract class LocalDataSource {
  Future<void> storeSessionId(String sessionId);

  Future<String> getSessionId();

  Future<void> deleteSessionId();
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  @override
  Future<String> getSessionId() async {
    final encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey != null) {
      final encryptionKeyUint8List = base64Url.decode(encryptionKey);
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      final sessionKey = encryptedBox.get('session_id');
      if (sessionKey != null) {
        return sessionKey;
      } else {
        throw const CacheException();
      }
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> storeSessionId(String sessionId) async {
    final encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey == null) {
      final generateEncryptionKey = Hive.generateSecureKey();
      await secureStorage.write(
          key: 'key', value: base64UrlEncode(generateEncryptionKey));
      final newEncryptionKey = await secureStorage.read(key: 'key');
      final encryptionKeyUint8List = base64Url.decode(newEncryptionKey!);
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      encryptedBox.put('session_id', sessionId);
    } else {
      final encryptionKeyUint8List = base64Url.decode(encryptionKey);
      final encryptedBox = await Hive.openBox('vaultBox',
          encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
      encryptedBox.put('session_id', sessionId);
    }
  }

  @override
  Future<void> deleteSessionId() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    try {
      encryptedBox.delete('session_id');
    } on Exception {
      throw const CacheException();
    }
  }
}
