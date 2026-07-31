# Hydra Engine (`hydra_engine`)

> Multi-Protocol Authentication Auditor  
> **Author & Original Architect:** [Abdallah Fawzi Ali Mahmoud](https://github.com/AbdoFawzi777)  
> **Part of the RedOps Hub Monorepo Suite**

---

## 📌 Overview
`hydra_engine` is a production-grade, standalone Flutter package engineered for high-performance mobile security auditing. Built with pure Dart and native Flutter MethodChannels/Isolates, it delivers enterprise-level capability directly on Android & iOS devices without relying on external Linux command-line dependencies.

---

## 🚀 New Capabilities & Features (v2.0)
- **Multi-Protocol Support:** High-speed credential testing for SSH, FTP, HTTP Basic/Digest, SMTP, POP3, and IMAP.
- **Adaptive Rate Limiting:** Intelligent backoff algorithms to prevent target account lockouts during authorized audits.
- **Custom Wordlist & Combo Streaming:** Efficient memory-mapped I/O processing for large username/password dictionaries.
- **Real-Time Match Dispatcher:** Emits instant notification events upon discovering valid authentication credentials.

---

## 🛠 Usage & Integration

Add `hydra_engine` to your Flutter `pubspec.yaml`:

```yaml
dependencies:
  hydra_engine:
    path: ../packages/hydra_engine
```

### Basic Example

```dart
import 'package:hydra_engine/hydra_engine.dart';

void main() async {
  final engine = HydraEngine();
  
  print('Starting Hydra Engine audit...');
  final results = await engine.execute(
    target: '192.168.1.1',
  );
  
  print('Audit Complete!');
}
```

---

## 🔒 Security & Privacy
- **Zero Telemetry:** No analytics, tracking, or network calls home.
- **Encrypted Local Storage:** Integrates seamlessly with RedOps Hub AES-256 local database.
- **Thread Safety:** All heavy operations execute inside Dart Isolates to maintain 60fps UI rendering.

---

## 👤 Author & Copyright

**Abdallah Fawzi Ali Mahmoud**  
Lead Developer & Security Architect of RedOps Hub  
- **GitHub:** [@AbdoFawzi777](https://github.com/AbdoFawzi777)  
- **Telegram:** [@ABdo_FawZi1](https://telegram.me/ABdo_FawZi1)  
- **Website:** [RedOps Hub Platform](https://redops-hub.web.app)

*Copyright (c) 2026 Abdallah Fawzi Ali Mahmoud. All rights reserved.*
