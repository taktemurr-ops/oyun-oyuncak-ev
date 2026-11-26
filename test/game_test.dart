import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_oyuncak_ev/oyun_oyuncak_ev.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(oyuncakEvConfig.title.length, 33);
    expect(oyuncakEvConfig.tagline.length, 33);
    for (final s in oyuncakEvConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(oyuncakEvConfig.gameId, oyuncakEvId);
    expect(oyuncakEvRules.gameId, oyuncakEvId);
    expect(oyuncakEvConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(oyuncakEvRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: oyuncakEvId, optionalMechanics: oyuncakEvRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(oyuncakEvRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
