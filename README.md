# hrms_uis

## Hrms Urmila App

## commands to generate apk

1. [ flutter clean ]
2. [ flutter pub get ]
3. [ flutter gen-l10n ]
4. [ dart run build_runner build --delete-conflicting-outputs ]

## create obfuscate apk using it
- [flutter build apk --release --shrink --obfuscate --split-debug-info=misc/mapping/${version} ]
- [ powershell -ExecutionPolicy Bypass -File build_release.ps1 ]

## or 
1. Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypas
2. build_release.ps1

## build apk command
- [powershell -ExecutionPolicy Bypass -File build_release_apk.ps1]

## build abb command
- [powershell -ExecutionPolicy Bypass -File build_release_abb.ps1]

// generate keystore -------------------------->>>
keytool -genkey -v -keystore $env:USERPROFILE\uis-keystore.jks `
        -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 `
-alias uis

## api urls
