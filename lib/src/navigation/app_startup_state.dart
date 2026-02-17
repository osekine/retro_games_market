import 'package:flutter/foundation.dart';
import 'package:retro_games_market/src/service/i_data_service.dart';

class AppStartupState extends ChangeNotifier {
  static const _keyFirstLaunch = 'is_first_launch';
  static const _keySubscription = 'has_subscription';

  final IDataService _dataService;

  bool _isInitialized = false;
  bool _isFirstLaunch = true;
  bool _hasSubscription = false;

  AppStartupState(this._dataService);

  bool get isInitialized => _isInitialized;
  bool get isFirstLaunch => _isFirstLaunch;
  bool get hasSubscription => _hasSubscription;

  Future<void> load() async {
    if (!_isInitialized) {
      // Для полной анимации индикатора
      await Future.delayed(const Duration(seconds: 2));
    }
    ;
    _isFirstLaunch = await _dataService.load<bool>(_keyFirstLaunch) ?? true;

    _hasSubscription = await _dataService.load<bool>(_keySubscription) ?? false;

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _isFirstLaunch = false;
    await _dataService.save(_keyFirstLaunch, false);
    notifyListeners();
  }

  Future<void> setSubscriptionActive(bool value) async {
    _hasSubscription = value;
    await _dataService.save(_keySubscription, value);
    notifyListeners();
  }

  // Для отладки
  Future<void> reset() async {
    _isFirstLaunch = true;
    _hasSubscription = false;

    await _dataService.save(_keyFirstLaunch, true);
    await _dataService.save(_keySubscription, false);

    notifyListeners();
  }
}
