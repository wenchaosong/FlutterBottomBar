### WaveBottomBar

[![](https://img.shields.io/pub/v/wave_bottom_bar.svg?color=blue)](https://pub.dev/packages/wave_bottom_bar)
[![](https://img.shields.io/github/last-commit/wenchaosong/FlutterBottomBar?color=yellow)](https://github.com/wenchaosong/FlutterBottomBar)

This is a bottom navigation bar widget that like a wave can smoothly move to the active position,
and provide much attrs to config it which you want, the package is small and simple, welcome to use

### Demo

[web Preview](https://wenchaosong.github.io/FlutterBottomBar/)

![video show](/pic/demo.mov)

![pic show](https://img.alicdn.com/imgextra/i3/2315514881/O1CN01nyvcZ31lvY9gqVbkI_!!2315514881.png)

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

