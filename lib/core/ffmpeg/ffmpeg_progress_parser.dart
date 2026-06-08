import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';

class FfmpegProgressParser {
  FfmpegProgressParser({this.maxPendingLines = 64});

  final int maxPendingLines;
  final _pendingLines = <String>[];

  bool get hasPendingOutput => _pendingLines.isNotEmpty;

  FFmpegProgress? addLine(String line) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final separatorIndex = trimmed.indexOf('=');
    if (separatorIndex <= 0) {
      _pendingLines.clear();
      return null;
    }

    _pendingLines.add(trimmed);
    if (_pendingLines.length > maxPendingLines) {
      _pendingLines.removeRange(0, _pendingLines.length - maxPendingLines);
    }

    if (!trimmed.startsWith('progress=')) {
      return null;
    }

    final snapshot = _pendingLines.join('\n');
    _pendingLines.clear();
    return FFmpegProgress.parseOutput(snapshot);
  }

  void reset() {
    _pendingLines.clear();
  }
}
