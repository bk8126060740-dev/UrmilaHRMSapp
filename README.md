# hrms_uis

## Hrms Urmila App

## commands to generate apk

1. [ flutter clean ]
2. [ flutter pub get ]
3. [ flutter gen-l10n ]
4. [ dart run build_runner build --delete-conflicting-outputs ]

## create obfuscate apk using it
-[ flutter build apk --release --shrink --obfuscate --split-debug-info=misc/mapping/${version} ]

## powershell -ExecutionPolicy Bypass -File build_release.ps1
