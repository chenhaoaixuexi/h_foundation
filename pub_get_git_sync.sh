#!/usr/bin/env bash

# 变量赋值
commit_message="add sh file"



flutter pub get &&
git add . && git commit -m "$commit_message" && git push
cd ../
flutter pub get