import '../../widgets/heartwood_icon.dart';

// ============================================================
// GROWTH STAGES — eight visual tiers tied to consecutive-day streak.
// Pure presentational derivation from the existing streak integer;
// no schema. Mirrors STAGES in heartwood-m0.html.
// ============================================================

class GrowthStage {
  final int minStreak;
  final String name;
  final HeartwoodIcon icon;
  final bool gold; // elder + heartwood get the gold treatment

  const GrowthStage(this.minStreak, this.name, this.icon, {this.gold = false});
}

const growthStages = <GrowthStage>[
  GrowthStage(120, 'Heartwood', HeartwoodIcon.heartwood, gold: true),
  GrowthStage(60, 'Elder', HeartwoodIcon.treeElder, gold: true),
  GrowthStage(30, 'Full tree', HeartwoodIcon.treeFull),
  GrowthStage(14, 'Grown tree', HeartwoodIcon.tree3),
  GrowthStage(7, 'Young tree', HeartwoodIcon.tree2),
  GrowthStage(3, 'Sapling', HeartwoodIcon.tree1),
  GrowthStage(1, 'Sprout', HeartwoodIcon.sprout),
  GrowthStage(0, 'Seed', HeartwoodIcon.seed),
];

GrowthStage stageFor(int streak) {
  for (final s in growthStages) {
    if (streak >= s.minStreak) return s;
  }
  return growthStages.last;
}

/// Deterministic pseudo-random 30-day history for a habit: trailing run
/// equals the streak (dots and number always agree), earlier days filled
/// with streak-density. Mirrors seededDots() in the mock.
List<bool> seededDots(String name, int streak) {
  var h = 0;
  for (var i = 0; i < name.length; i++) {
    h = (h * 31 + name.codeUnitAt(i)) & 0xFFFFFFFF;
  }
  final density = (0.22 + streak / 140).clamp(0.0, 0.92);
  final days = <bool>[];
  for (var i = 0; i < 29; i++) {
    h = (h * 1103515245 + 12345) & 0xFFFFFFFF;
    final on = i >= 29 - (streak > 29 ? 29 : streak) ||
        ((h >> 16) & 0xFFFF) / 0xFFFF < density;
    days.add(on);
  }
  days.add(streak > 0);
  return days;
}

/// Seven-day dot row: last 7 days, today = ring. Mirrors `.dot-row`.
/// [checkedDayKeys] are real check-in day keys (YYYY-MM-DD) when available.
List<bool> sevenDayRow(Set<String> checkedDayKeys, DateTime today) {
  final out = <bool>[];
  for (var i = 6; i >= 0; i--) {
    final d = today.subtract(Duration(days: i));
    final key = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    out.add(checkedDayKeys.contains(key));
  }
  return out;
}