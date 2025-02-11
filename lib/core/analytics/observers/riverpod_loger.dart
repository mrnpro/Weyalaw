import 'package:go_find_taxi/core/utils/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    printLog('''
{
  "provider": "${provider.name ?? provider.runtimeType}"
}''');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    printLog('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    printError('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "error": "$error",
  "stackTrace": "$stackTrace"
}''');
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
