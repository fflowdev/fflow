import 'dart:io';

import 'package:flutter/foundation.dart';

final bool kUseCustomWindowTitleBar =
    !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
