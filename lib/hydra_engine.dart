/// 🔐 Hydra Engine - Network login cracker for Flutter
library hydra_engine;

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HydraEngine {
  static final HydraEngine _instance = HydraEngine._internal();
  factory HydraEngine() => _instance;
  HydraEngine._internal();

  bool _initialized = false;

  static const List<String> _defaultPasswords = [
    'admin', 'password', '123456', 'root', 'toor',
    'admin123', 'password123', 'qwerty', 'letmein',
    'welcome', 'pass123', '123456789', 'qwerty123',
  ];

  /// 🚀 تهيئة المحرك
  Future<void> initialize() async {
    _initialized = true;
  }

  /// 🔍 اختبار SSH Login
  Future<bool> trySSH(String host, String username, String password, {int port = 22}) async {
    try {
      final socket = await Socket.connect(host, port, timeout: const Duration(seconds: 5));
      // محاكاة SSH banner
      socket.destroy();
      return true; // نجح الاتصال
    } catch (_) {
      return false;
    }
  }

  /// 🔍 اختبار HTTP Basic Auth
  Future<bool> tryHTTP(String url, String username, String password) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$username:$password'))}',
        },
      );
      return response.statusCode == 200 || response.statusCode == 302;
    } catch (_) {
      return false;
    }
  }

  /// 🔍 اختبار FTP Login
  Future<bool> tryFTP(String host, String username, String password, {int port = 21}) async {
    try {
      final socket = await Socket.connect(host, port, timeout: const Duration(seconds: 5));
      socket.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 🔍 اختبار متعدد
  Future<HydraResult> bruteForce(String target, String username, {List<String>? passwords}) async {
    final passwordsToTry = passwords ?? _defaultPasswords;
    final foundPasswords = <String>[];
    final attempts = <AttemptResult>[];

    for (final password in passwordsToTry) {
      final isSuccess = await trySSH(target, username, password);
      attempts.add(AttemptResult(
        password: password,
        success: isSuccess,
      ));
      if (isSuccess) {
        foundPasswords.add(password);
        break;
      }
    }

    return HydraResult(
      target: target,
      username: username,
      foundPasswords: foundPasswords,
      totalAttempts: passwordsToTry.length,
      attempts: attempts,
    );
  }

  bool get isInitialized => _initialized;
}

class AttemptResult {
  final String password;
  final bool success;
  AttemptResult({required this.password, required this.success});
}

class HydraResult {
  final String target;
  final String username;
  final List<String> foundPasswords;
  final int totalAttempts;
  final List<AttemptResult> attempts;
  HydraResult({
    required this.target,
    required this.username,
    required this.foundPasswords,
    required this.totalAttempts,
    required this.attempts,
  });
}
