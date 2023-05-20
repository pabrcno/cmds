@echo off
echo Installing Global Dependencies for react native...

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