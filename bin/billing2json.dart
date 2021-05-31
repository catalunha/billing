// import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:billing2json/billing2json.dart' as billing2json;
import 'package:xml2json/xml2json.dart';

import 'xml.dart';

void main(List<String> arguments) {
  print('Hello world: ${billing2json.calculate()}!');
  // Create a client transformer
  final myTransformer = Xml2Json();
  var file = 'KJ8LB10';
  var path = '/home/catalunha/gdrive/iza/Fatura/FaturaBH';
  print('$file');
  File('$path/$file.xml').readAsString().then((String contents) async {
    // print(contents);
    myTransformer.parse(contents);
    print('XML string');

    // Transform to JSON using Parker
    var json = myTransformer.toParker();
    print('XMLtoJSONParker');
    print('');
    // print(json);
    await File('$path/$file.json')
        .writeAsString(json)
        .then((value) => print('Convert finalized'));
  });
  // Parse a simple XML string
}
