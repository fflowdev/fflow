import 'package:fflow/core/ffmpeg/ffmpeg_progress_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FfmpegProgressParser', () {
    test('emits progress only when the block is complete', () {
      final parser = FfmpegProgressParser();

      expect(parser.addLine('frame=120'), isNull);
      expect(parser.addLine('fps=25.2'), isNull);

      final progress = parser.addLine('progress=continue');
      expect(progress, isNotNull);
      expect(progress?.frame, 120);
      expect(progress?.fps, 25.2);
      expect(parser.hasPendingOutput, isFalse);
    });

    test('drops partial progress when non progress output appears', () {
      final parser = FfmpegProgressParser();

      expect(parser.addLine('frame=120'), isNull);
      expect(parser.hasPendingOutput, isTrue);

      expect(parser.addLine('plain stdout line'), isNull);
      expect(parser.hasPendingOutput, isFalse);

      final progress = parser.addLine('progress=end');
      expect(progress, isNotNull);
      expect(progress?.frame, isNull);
      expect(progress?.progress, 'end');
    });

    test('keeps only the newest buffered lines', () {
      final parser = FfmpegProgressParser(maxPendingLines: 2);

      expect(parser.addLine('frame=120'), isNull);
      expect(parser.addLine('fps=25.2'), isNull);

      final progress = parser.addLine('progress=end');
      expect(progress, isNotNull);
      expect(progress?.frame, isNull);
      expect(progress?.fps, 25.2);
      expect(progress?.progress, 'end');
    });
  });
}
