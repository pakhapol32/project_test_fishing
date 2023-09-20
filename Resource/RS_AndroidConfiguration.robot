*** Settings ***
Documentation  Basic configuration for emulator's connection
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                C:/Users/MSI/Desktop/Test_Projact/apk/app-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=9}

# runของโทรศํพในแอนดรอยสตูดีโอ
# ${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=12}