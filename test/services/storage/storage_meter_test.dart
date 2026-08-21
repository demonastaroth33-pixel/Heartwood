import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/services/storage/storage_meter.dart';

void main() {
  test('warning levels: below 70 none, 70+ warn, 90+ hard warn', () {
    expect(
      warningLevel(usedBytes: 50, quotaBytes: 100),
      StorageLevel.none,
    );
    expect(
      warningLevel(usedBytes: 70, quotaBytes: 100),
      StorageLevel.warn,
    );
    expect(
      warningLevel(usedBytes: 89.9, quotaBytes: 100),
      StorageLevel.warn,
    );
    expect(
      warningLevel(usedBytes: 90, quotaBytes: 100),
      StorageLevel.hardWarn,
    );
    expect(
      warningLevel(usedBytes: 95, quotaBytes: 100),
      StorageLevel.hardWarn,
    );
  });

  test('no quota → no level', () {
    expect(
      warningLevel(usedBytes: 100, quotaBytes: 0),
      StorageLevel.none,
    );
  });
}