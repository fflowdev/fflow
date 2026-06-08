import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FFmpegProgress', () {
    test('parses progress output with snake case fields', () {
      final progress = FFmpegProgress.parseOutput('''
frame=120
fps=25.2
bitrate=102.5kbits/s
total_size=48234
out_time_ms=4000000
speed=1.42x
progress=continue
''');

      expect(progress.frame, 120);
      expect(progress.fps, 25.2);
      expect(progress.totalSize, 48234);
      expect(progress.outTimeMs, 4000000);
      expect(progress.outTime, const Duration(seconds: 4));
      expect(progress.progress, 'continue');
    });

    test('keeps equals signs inside values', () {
      final progress = FFmpegProgress.parseOutput('''
frame=1
fps=1
bitrate=N/A
total_size=0
out_time_ms=0
speed=label=value
progress=end
''');

      expect(progress.speed, 'label=value');
    });

    test('rejects malformed lines', () {
      expect(
        () => FFmpegProgress.parseOutput('not a key value line'),
        throwsFormatException,
      );
    });
  });
}
