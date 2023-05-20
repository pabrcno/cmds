@echo off

set ANDROID_STUDIO_PATH="C:\Program Files\Android\Android Studio"

IF EXIST %ANDROID_STUDIO_PATH% (
    ECHO Android Studio is already installed.
) ELSE (
    ECHO Android Studio is not installed.
    
    echo Downloading Command Line Tools...

    powershell -Command "Invoke-WebRequest -OutFile cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-win-7583922_latest.zip"

    echo Extracting Command Line Tools...
    tar -xvf cmdline-tools.zip -C %LOCALAPPDATA%\Android\Sdk

    echo Removing downloaded zip...
    del cmdline-tools.zip

    echo Setting environment variable...
    setx PATH "%PATH%;%LOCALAPPDATA%\Android\Sdk\cmdline-tools\latest\bin"

    echo Updating SDK Manager...
    call sdkmanager --update
    sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.2" "emulator"
)


echo Installing Global Dependencies...

REM Check Node and npm installation
node -v || (
    echo Node.js is not installed.
    echo Please install Node.js from https://nodejs.org/ before running this script.
    exit /b
)

npm -v || (
    echo npm is not installed.
    echo Please install npm (usually comes with Node.js) before running this script.
    exit /b
)

echo Installing Expo CLI...
call npm install --global expo-cli

echo Installing Yarn...
call npm install --global yarn

echo Installing react-native...
call npm install --global react-native

echo Installing create-react-native-app...
call npm install --global create-react-native-app

echo Dependencies Installed Successfully!