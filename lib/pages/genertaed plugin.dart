import 'package:google_sign_in_web/google_sign_in_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

//ignore: public_member_api_docs;
void registerPlugins(Registrar registrar) {
  GoogleSignInPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}