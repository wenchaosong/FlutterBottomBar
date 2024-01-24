### WaveBottomBar

[![](https://img.shields.io/pub/v/flutter_bottom_bar.svg?color=blue)](https://pub.dev/packages/flutter_bottom_bar)
[![](https://img.shields.io/github/last-commit/wenchaosong/FlutterBottomBar?color=yellow)](https://github.com/wenchaosong/FlutterBottomBar)

This is a bottom navigation bar widget that like a wave can smoothly move to the active position,
and provide much attrs to config it which you want, the package is small and simple, welcome to use

### Demo

[web Preview](https://wenchaosong.github.io/FlutterBottomBar/)

#### Installation

```
dependencies:
    flutter_bottom_bar: ^1.0.0
```

#### Basic Usage

1.Simple Usage

```
    bottomNavigationBar: WaveBottomBar(
        amplitude: 35,
        waveLength: 100,
        items: BarItem.normalItems,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        onTap: (index) {
          debugPrint("$index");
        },
      ),
```

2.Full Usage

```
    bottomNavigationBar: WaveBottomBar(
        amplitude: 35,
        waveLength: 100,
        items: BarItem.normalItems,
        selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        onTap: (index) {
          debugPrint("$index");
        },
      ),
```

#### FAQs

none

