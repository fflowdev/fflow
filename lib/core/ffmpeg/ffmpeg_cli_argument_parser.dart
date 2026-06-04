import 'package:ffmpeg_cli/ffmpeg_cli.dart';

class FfmpegCliArgumentParser {
  const FfmpegCliArgumentParser();

  // 正则解析：
  // 1. (-[a-zA-Z0-9_:]+) -> Group 1: 匹配以 '-' 开头的键，如 -c:v, -b:a
  // 2. (?:\s+ ... )?     -> 整个值部分是可选的（为了支持像 -y 这样没有值的参数）
  // 3. (?!-[a-zA-Z])     -> 负向先行断言：确保值不能是下一个参数的 key
  //（不以 '-字母' 开头），但允许值为 '-2'（负数）
  // 4. ("[^"]*"|'[^']*'|\S+) -> Group 2: 匹配包含在双引号、单引号中的字符串，或者不包含空格的普通字符串
  static final _regex = RegExp(
    r'''(-[a-zA-Z0-9_:]+)(?:\s+(?!-[a-zA-Z])("[^"]*"|\'[^\']*\'|\S+))?''',
  );

  Iterable<CliArg> parse(String input) {
    final matches = _regex.allMatches(input);
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
