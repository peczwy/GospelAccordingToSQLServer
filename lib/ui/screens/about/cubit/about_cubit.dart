import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'about_cubit.freezed.dart';
part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState());

  Future<void> initialize() async {
    final data = await rootBundle.loadString('data/metadata/sqls.json');
    final repository = SQLRepository.fromJson(jsonDecode(data));
  }

  void downloadFile() {
    final url =
        'https://raw.githubusercontent.com/peczwy/GospelAccordingToSQLServer/main/public/articles/2016_detjmr.pdf';
    var html;
    html.window.open(url, 'PlaceholderName');
    // html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    // anchorElement.download = url;
    // anchorElement.click();
  }
}
