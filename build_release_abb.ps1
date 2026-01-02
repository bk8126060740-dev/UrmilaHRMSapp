# Read version from pubspec.yaml
$version = Select-String -Path "pubspec.yaml" -Pattern "^version:" |
           ForEach-Object { $_.ToString().Split(":")[1].Trim() }

Write-Host "Mapping saved at: $mappingPath"

# Create mapping folder path
$mappingPath = "misc/mapping/$version"

# Ensure folder exists
New-Item -ItemType Directory -Force -Path $mappingPath

# Build AAB (Play Store recommended)
flutter build appbundle --release --shrink --obfuscate --split-debug-info=$mappingPath


Write-Host "Build completed!"
Write-Host "Mapping saved at: $mappingPath"
