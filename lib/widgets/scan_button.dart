import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus_outlined),
      onPressed: () async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                      '#3D8BEF',
                                      'Cancelar', 
                                      false, 
                                      ScanMode.QR);
        //final barcodeScanRes = 'https://solrex.cl';
        //final barcodeScanRes = 'geo:-33.351551,-70.726972';

        if(barcodeScanRes == '-1'){
          return;
        }

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchInBrowser(context,nuevoScan);
      },
    );
  }
}