import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ImagesToPdfService {
  Future<File> generate( List<XFile> images) async{
    final pdf = pw.Document() ;
    for(final image in images){
      final bytes =  await image.readAsBytes();
      final pdfImage = pw.MemoryImage(bytes);
      
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (_) {
            return pw.Center(
              child: pw.Image(
                pdfImage,
                fit: pw.BoxFit.contain  
              )
            );
          }
        )
      );
      
    }
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/generated_notes.pdf');
    
    await file.writeAsBytes(
      await pdf.save()
    );
    return file;
    
  }
}

