import 'package:fflow/core/ffmpeg/ffmpeg_progress.dart';
import 'package:fflow/core/ffmpeg/ffmpeg_runner.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart' hide Stream;

enum FfmpegTaskStatus {
  queued,
  running,
  paused,
  stopping,
  canceled,
  succeeded,
  failed,
}

extension FfmpegTaskStatusX on FfmpegTaskStatus {
  bool get isTerminal =>
      this == FfmpegTaskStatus.canceled ||
      this == FfmpegTaskStatus.succeeded ||
      this == FfmpegTaskStatus.failed;

  bool get reservesExecutionSlot =>
      this == FfmpegTaskStatus.running ||
      this == FfmpegTaskStatus.paused ||
      this == FfmpegTaskStatus.stopping;
}

class FfmpegTaskRequest {
  const FfmpegTaskRequest({
    required this.command,
    this.id,
    this.label,
  });

  final String? id;
  final String? label;
  final FfmpegCommand command;
}

class FfmpegTask {
  const FfmpegTask({
    required this.id,
    required this.command,
    required this.status,
    required this.createdAt,
    required this.queuedAt,
    required this.attempt,
    required this.supportsPause,
    this.label,
    this.startedAt,
    this.endedAt,
    this.progress,
    this.runResult,
    this.stopResult,
    this.lastStdoutLine,
    this.lastStderrLine,
    this.errorMessage,
  });

  static const _sentinel = Object();

  final String id;
  final String? label;
  final FfmpegCommand command;
  final FfmpegTaskStatus status;
  final DateTime createdAt;
  final DateTime queuedAt;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final int attempt;
  final bool supportsPause;
  final FFmpegProgress? progress;
  final FfmpegRunResult? runResult;
  final FfmpegStopResult? stopResult;
  final String? lastStdoutLine;
  final String? lastStderrLine;
  final String? errorMessage;

  bool get canStart => status == FfmpegTaskStatus.queued || status.isTerminal;

  bool get canPause => supportsPause && status == FfmpegTaskStatus.running;

  bool get canResume => status == FfmpegTaskStatus.paused;

  bool get canStop =>
      status == FfmpegTaskStatus.queued ||
      status == FfmpegTaskStatus.running ||
      status == FfmpegTaskStatus.paused ||
      status == FfmpegTaskStatus.stopping;

  bool get canRemove => status != FfmpegTaskStatus.stopping;

  FfmpegTask copyWith({
    String? id,
    Object? label = _sentinel,
    FfmpegCommand? command,
    FfmpegTaskStatus? status,
    DateTime? createdAt,
    DateTime? queuedAt,
    Object? startedAt = _sentinel,
    Object? endedAt = _sentinel,
    int? attempt,
    bool? supportsPause,
    Object? progress = _sentinel,
    Object? runResult = _sentinel,
    Object? stopResult = _sentinel,
    Object? lastStdoutLine = _sentinel,
    Object? lastStderrLine = _sentinel,
    Object? errorMessage = _sentinel,
  }) {
    return FfmpegTask(
      id: id ?? this.id,
      label: identical(label, _sentinel) ? this.label : label as String?,
      command: command ?? this.command,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      queuedAt: queuedAt ?? this.queuedAt,
      startedAt: identical(startedAt, _sentinel)
          ? this.startedAt
          : startedAt as DateTime?,
      endedAt: identical(endedAt, _sentinel)
          ? this.endedAt
          : endedAt as DateTime?,
      attempt: attempt ?? this.attempt,
      supportsPause: supportsPause ?? this.supportsPause,
      progress: identical(progress, _sentinel)
          ? this.progress
          : progress as FFmpegProgress?,
      runResult: identical(runResult, _sentinel)
          ? this.runResult
          : runResult as FfmpegRunResult?,
      stopResult: identical(stopResult, _sentinel)
          ? this.stopResult
          : stopResult as FfmpegStopResult?,
      lastStdoutLine: identical(lastStdoutLine, _sentinel)
          ? this.lastStdoutLine
          : lastStdoutLine as String?,
      lastStderrLine: identical(lastStderrLine, _sentinel)
          ? this.lastStderrLine
          : lastStderrLine as String?,
      errorMessage: identical(errorMessage, _sentinel)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}
