import 'dart:io';

import 'package:flutter/foundation.dart';

final bool useCustomWindowTitleBar =
    !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
