# react-native-airplay

AirPlay library for iOS

## Installation
Add this line to your package.json:

```
"react-native-airplay": "SweatWorking/react-native-airplay",
```

#### Only iOS

  - Open your Xcode project
  - In `Libraries` choose `Add files...` and add the obj-c/swift files from `node_modules/react-native-airplay` folder.
  - If Xcode ask you for include the 'Bridging-Header.h', accept it.
  - Include in the `Bridging-Header.h` the next lines:

  ```
#import <React/RCTViewManager.h>
#import <React/RCTEventEmitter.h>
  ```
  
  - Rebuild your project and done!
  
  Clone the Example if you need how to include in js.
