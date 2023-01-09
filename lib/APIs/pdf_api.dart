import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfApi {
  static Future<File> generate(String myID, String username, var url) async {
    final pdf = Document();
    final netImage = await networkImage(url);
    pdf.addPage(
      MultiPage(
          build: (context) => <Widget>[
                Header(child: Text('Pre-Interview Details Screeener')),
                Column(children: [
                  Text("Uid:  " + myID),
                  Text("Name:  " + username),
                  SizedBox(height: 20),
                  Text('GNM Certificate'),
                  SizedBox(height: 20),
                  Container(width: 100, height: 200, child: Image(netImage))
                ]),
              ]),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['jeswin.p.jaison@gmail.com'],
      cc: ['jeswin.p.jaison@gmail.com'],
      bcc: ['jeswin.p.jaison@gmail.com'],
      attachmentPaths: [url],
      isHTML: false,
    );
    //await FlutterEmailSender.send(email);
    await OpenFilex.open(url);
  }
}
