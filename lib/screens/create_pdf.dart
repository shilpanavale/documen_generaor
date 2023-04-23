import 'dart:io';

import 'package:document_generator/screens/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CreatePDF extends StatelessWidget {
  final pdf = pw.Document();

  CreatePDF({super.key});

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
        pw.Header(
        level: 1,
        child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <pw.Widget>[
        pw.Text('District Deputy Registrar, Co-operative Societies\nThane Office of the Competent Authority\n'
            'under section 5A of the Maharashtra Ownership Flats Act, 1963\nFirst floor, Gavdevi Bhaji Mandai, Near Gavdevi Maidan, Gokhale Road, Thane(w) 400602,', textScaleFactor: 2),
        ])),

        pw.Header(level: 1, text: 'No. DDR /TNA/ deemed conveyance/Notice/123456 /2023 Date:-11/11 /2023FORM X[See rule 13(2)]Form of Notice to the concerned parties.Before the Competent Authority at First floor, Gavdevi Bhaji Mandai, Near Gavdevi Maidan,Gokhale Road, Thane(w) 400602Application u/s 11 of the Maharashtra Ownership Flats (Regulation of the Promotion ofConstruction, Sale, Management and Transfer Act, 1963)'),

        // Write All the paragraph in one line.
        // For clear understanding
        // here there are line breaks.
        pw.Paragraph(
        text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. '),
        pw.Paragraph(
        text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortoraliquam nulla facilisi cras fermentum. '),
        pw.Header(level: 1, text: 'This is Header'),
        pw.Paragraph(
        text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquamnulla facilisi cras fermentum. Consectetur adipiscing elit duis tristiquesollicitudin nibh sit. '),
        pw.Paragraph(
        text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit liberovolutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellusmolestie nunc non blandit massa. Bibendum enim facilisis gravida neque.Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diamvulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquamnulla facilisi cras fermentum. Consectetur adipiscing elit duis tristiquesollicitudin nibh sit. '),
        pw.Padding(padding: const pw.EdgeInsets.all(10)),
        pw.Table.fromTextArray(context: context, data: const <List<String>>[
        <String>['Year', 'Sample'],
        <String>['SN0', 'GFG1'],
        <String>['SN1', 'GFG2'],
        <String>['SN2', 'GFG3'],
        <String>['SN3', 'GFG4'],
        ]),
        ];
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Geeksforgeeks"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: TextButton(

                child: Text(
                  'Preview PDF',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {


                  Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

                  String documentPath = documentDirectory.path;

                  String fullPath = "$documentPath/example.pdf";
                  print(fullPath);
                 var check= File("path/to/file").exists();
                 if(check==true){
                   OpenFile.open('$fullPath');
                 }else{
                   writeOnPdf();
                   await savePdf();
                   Directory documentDirectory =
                   await getApplicationDocumentsDirectory();

                   String documentPath = documentDirectory.path;

                   String fullPath = "$documentPath/example.pdf";
                   OpenFile.open('$fullPath');
                 }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PdfPreviewScreen(
                  //           path: fullPath,
                  //         )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(await pdf.save());
  }
}