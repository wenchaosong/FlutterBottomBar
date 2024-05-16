### WaveBottomBar

[![](https://img.shields.io/pub/v/wave_bottom_bar.svg?color=blue)](https://pub.dev/packages/wave_bottom_bar)
[![](https://img.shields.io/github/last-commit/wenchaosong/FlutterBottomBar?color=yellow)](https://github.com/wenchaosong/FlutterBottomBar)

This is a bottom navigation bar widget that like a wave can smoothly move to the active position,
and provide much attrs to config it which you want, the package is small and simple, welcome to use

### Demo

[web Preview](https://wenchaosong.github.io/FlutterBottomBar/)

![video show](/pic/demo.mp4)

![pic show](https://img.alicdn.com/imgextra/i2/2315514881/O1CN01FLTeuU1lvY9ZTBHXO_!!2315514881.png_760x760)

#### Install

```
dependencies:
    wave_bottom_bar: ^1.6.0
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

