### WaveBottomBar

[![](https://img.shields.io/pub/v/wave_bottom_bar.svg?color=blue)](https://pub.dev/packages/wave_bottom_bar)
[![](https://img.shields.io/github/last-commit/wenchaosong/FlutterBottomBar?color=yellow)](https://github.com/wenchaosong/FlutterBottomBar)

This is a bottom navigation bar widget that like a wave can smoothly move to the active position,
and provide much attrs to config it which you want, the package is small and simple, welcome to use

### Demo

[web Preview](https://wenchaosong.github.io/FlutterBottomBar/)

![pic](https://img.alicdn.com/imgextra/i2/2315514881/O1CN01XTcLJs1lvY7MI2Med_!!2315514881.gif)

#### Install

```
dependencies:
    wave_bottom_bar: ^1.0.0
```

#### Simple Usage

```
    bottomNavigationBar: WaveBottomBar(
        items: BarItem.simpleUse,
        onTap: (index) {
            debugPrint("$index");
        },
    ),
```

