#!/usr/bin/env bash

flutter clean &&
flutter pub get &&
flutter build appbundle --release
