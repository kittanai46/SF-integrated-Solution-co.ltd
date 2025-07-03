#!/usr/bin/env bash

flutter clean &&
flutter pub get &&
flutter build apk --release
