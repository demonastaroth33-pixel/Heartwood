/// Developer preview mode: forces the app into the mobile or desktop layout
/// regardless of the real window width (like the reference mock's
/// Desktop/Mobile toggle). 'auto' (default) follows the window.
/// Wired into Settings → Developer → Preview mode.
const kDeviceModeKey = 'dev_device_mode';

enum DeviceMode { auto, mobile, desktop }

DeviceMode deviceModeFrom(String? value) {
  switch (value) {
    case 'mobile':
      return DeviceMode.mobile;
    case 'desktop':
      return DeviceMode.desktop;
    default:
      return DeviceMode.auto;
  }
}

/// The forced layout width for a mode (the reference phone width / a desktop
/// width), or null in auto mode (follow the real window).
double? forcedLayoutWidth(DeviceMode mode) {
  switch (mode) {
    case DeviceMode.mobile:
      return 390;
    case DeviceMode.desktop:
      return 1280;
    case DeviceMode.auto:
      return null;
  }
}