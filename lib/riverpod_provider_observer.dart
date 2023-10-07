import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('''
      { didAddProvider
        "provider": "${provider.name ?? provider.runtimeType}",
        "newValue": "$value"
      }''');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
      { didUpdateProvider
        "provider": "${provider.name ?? provider.runtimeType}",
        "newValue": "$newValue"
      }''');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('''
      { didDisposeProvider
        "provider": "${provider.name ?? provider.runtimeType}",
      }''');
  }
}
