// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:audioplayers_web/audioplayers_web.dart';
import 'package:file_selector_web/file_selector_web.dart';
import 'package:permission_handler_html/permission_handler_html.dart';
import 'package:printing/printing_web.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AudioplayersPlugin.registerWith(registrar);
  FileSelectorWeb.registerWith(registrar);
  WebPermissionHandler.registerWith(registrar);
  PrintingPlugin.registerWith(registrar);
  VideoPlayerPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
