# Retro Games Market (Flutter)

Кроссплатформенное приложение-магазин ретро-игр на Flutter (iOS/Android), с ретро UI-kit, онбордингом и подписочной моделью доступа.

## Флоу экранов

Навигация реализована на `go_router` и зависит от состояния запуска приложения (первый/не первый запуск) и статуса подписки.

### Первый запуск
Onboarding → Paywall → Payment Processing → Home

### Повторный запуск (подписка активна)
Loading → Home

### Повторный запуск (подписки нет)
Paywall → Payment Processing → Home

> Примечание: пока логика подписки/покупки моковая (Presentation-only). Далее будет заменена на Domain/Data.

## Архитектура

Проект построен в стиле Clean Architecture, но на текущем этапе реализованы только:
- **Navigation layer**
- **Presentation layer**
- **ViewModel/State layer**

Слои **Domain** и **Data** будут добавлены позже.

### Общая схема зависимостей

UI (Widgets/Screens)
  → ViewModel/State (ChangeNotifier/VM)
    → (пока напрямую мок/сервис хранения)
    → (позже) Domain (UseCases, Entities, Repositories interfaces)
      → Data (Repositories impl, Mappers, DataSources, API/DB)

### Структура по смыслу

- `app/`
  - `navigation/` — конфигурация `go_router`, правила редиректов, маршруты
  - `startup/` — состояние запуска приложения (первый запуск / подписка), загрузка из storage
  - `theme/` — палитра, ThemeData (Material 2), ThemeExtensions (ретро-тени/бордеры)
  - `data/` (частично сейчас) — IDataService + реализация на SharedPreferences

- `features/`
  - `onboarding/` — экран онбординга (PageView, индикатор, Continue)
  - `paywall/` — экран покупки (выбор тарифов, кнопки, ссылки)
  - `payment_processing/` — моковый экран обработки платежа (анимация + success)
  - `greetings/` — приветственный экран (при активной подписке)
  - `home/` — главный экран (список игр)
  - (и т.п. по мере роста)

- `shared/`
  - общие виджеты (например, кастомные лоадеры, ретро-контейнеры, типографика)

## UI-kit / Темизация

Используется кастомная тема на основе токенов дизайна:
- `bg`, `surface`, `surfaceAlt`, `border`, `shadow`
- `textPrimary`, `textSecondary`, `textDisabled`
- `accent`, `onAccent`, `error`, `success`

Material 3 отключён (`useMaterial3: false`), стили настроены под Material 2.

Визуальный стиль: “ретро” — минимальный blur, тени имитируются offset-ом (1–2px), строгие бордеры.

## Хранение данных (на текущем этапе)

Для хранения простых флагов используется `IDataService` с имплементацией на `SharedPreferences`:

- сохранение: `save(Object id, Object? value)`
- загрузка: `load<T>(Object id)`

Пока сервис используется в `AppStartupState` для хранения:
- `is_first_launch` (bool)
- `has_subscription` (bool)

## Roadmap

Ниже план работ для перехода от “Presentation-only” к полноценной Clean Architecture.

### 1) Domain layer (обязательно)
Создать модуль Domain, который не зависит от Flutter/UI.

### 2) Data layer (обязательно)
Реальные источники данных + преобразование данных во внутренние модели.

### 3) Mapping layer (DTO ↔ Domain)
Слой маппинга нужен, чтобы:
- UI/Domain не зависели от формата API
- можно было легко менять backend/хранилище

### 4) Dependency Injection
Добавить DI `get_it` (+ `injectable` опционально)

Цель: ViewModel получает UseCase, UseCase получает Repository interface, реализация подставляется из Data.

### 5) Тестирование
Минимум:
- unit-тесты UseCases (Domain)
- unit-тесты Mappers (Data)
- widget-тесты ключевых экранов (Paywall, Onboarding)
- тесты редиректов `go_router` (startup flows)

### 6) CI
GitHub Actions:
- `dart format --set-exit-if-changed`
- `dart analyze`
- `flutter test`

## Запуск проекта

```bash
flutter pub get
flutter run
