/*
 * Copyright (c) 2021 MyLittleSuite
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:flutter_flavorizr/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/processors/commons/queue_processor.dart';
import 'package:flutter_flavorizr/processors/ios/xcconfig/ios_xcconfig_mode_file_processor.dart';

class IOSXCConfigFileProcessor extends QueueProcessor {
  static const List<String> _modes = ['Debug', 'Release'];

  IOSXCConfigFileProcessor(
    String process,
    String script,
    String project,
    String path,
    String appName,
    String flavorName, {
    required Flavorizr config,
  }) : super(
          _modes.map(
            (String mode) => IOSXCConfigModeFileProcessor(
              process,
              script,
              project,
              '$path/$flavorName$mode.xcconfig',
              appName,
              flavorName,
              config: config,
            ),
          ),
          config: config,
        );

  @override
  String toString() => 'IOSXCConfigFileProcessor';
}
