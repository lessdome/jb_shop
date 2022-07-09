// ignore_for_file: prefer_final_fields

import 'dart:ui';

class SizeFit {
  static double _physicalWidth = 0;

  /// 屏幕物理像素宽度
  static double get physicalWidth {
    return _physicalWidth;
  }

  static double _physicalHieght = 0;

  /// 屏幕物理像素高度
  static double get physicalHieght {
    return _physicalHieght;
  }

  static double _dpr = 0;

  /// 物理像素和逻辑像素比 dpr
  static double get dpr {
    return _dpr;
  }

  static double _screenWidth = 0;

  /// 屏幕逻辑宽度
  static double get screenWidth {
    return _screenWidth;
  }

  static double _screenHeight = 0;

  /// 屏幕逻辑高度
  static double get screenHeight {
    return _screenHeight;
  }

  static double _statusHeight = 0;

  /// 状态栏逻辑高度
  static double get statusHeight {
    return _statusHeight;
  }

  static double _safeBottomHeight = 0;

  /// 安全区逻辑高度
  static double get safeBottomHeight {
    return _safeBottomHeight;
  }

  static double _rpx = 0;

  /// 视觉稿逻辑宽度单位值
  static double get rpx {
    return _rpx;
  }

  static double _px = 0;

  /// 视觉稿像素宽度单位值
  static double get px {
    return _px;
  }

  static double _standardSize = 0;

  /// 初始化的视觉稿宽度
  static double get standardSize {
    return _standardSize;
  }

  /// 初始化函数 要在组件入口挂载处调用
  /// [standardSize] 视觉稿宽度 默认是750
  static void initialze({double standardSize = 750}) {
    // 1. 手机的物理分辨率
    _physicalWidth = window.physicalSize.width;
    _physicalHieght = window.physicalGeometry.height;

    // 2. 获取 _dpr
    _dpr = window.devicePixelRatio;

    // 3. 获取渲染宽度和高度
    _screenWidth = _physicalWidth / _dpr;
    _screenHeight = _physicalHieght / _dpr;

    // 4. 获取状态栏
    _statusHeight = window.padding.top / _dpr;

    // 5. 获取底部安全区高度
    _safeBottomHeight = window.padding.bottom / _dpr;

    // 6. 设置rpx的单位值
    _rpx = _screenWidth / standardSize;
    // 7. 设置px的单位制
    _px = _physicalWidth / standardSize;

    // 8. 初始化最大阈值
    _standardSize = standardSize;
  }

  static double setRpx(double size) {
    if (size == _standardSize) {
      return _screenWidth;
    }

    return _rpx * size;
  }

  static double setPx(double size) {
    if (size == _standardSize) {
      return _physicalWidth;
    }

    return _px * size;
  }
}

extension SizeFitExtension on num {
  double get px {
    return SizeFit.setPx(toDouble());
  }

  double get rpx {
    return SizeFit.setRpx(toDouble());
  }
}
