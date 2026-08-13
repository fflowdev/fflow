import 'package:fflow/core/ffmpeg/ffmpeg_cli_argument_regex.dart';
import 'package:ffmpeg_cli/ffmpeg_cli.dart';

class FfmpegCliArgumentParser {
  const FfmpegCliArgumentParser();

  Iterable<CliArg> parse(String input) {
    final matches = ffmpegCliArgumentRegex.allMatches(input);
    return matches.map((match) {
      var key = match.group(1)!;
      if (key.startsWith('-')) {
        key = key.substring(1);
      }
      // 如果获取到的 value 带引号，可以用 replaceAll 去除首尾的引号
      final value = match
          .group(2)
          ?.replaceAll(RegExp(r'''^["\']|["\']$'''), '');
      return CliArg(name: key, value: value);
    });
  }
}
