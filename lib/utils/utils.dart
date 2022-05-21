
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchInBrowser(BuildContext context, ScanModel scan) async {

  final Uri _url = Uri.parse(scan.valor);
  if(scan.tipo == 'http'){
    //Abrir sitio web
    if (!await launchUrl(
        _url, 
        mode: LaunchMode.externalApplication,
        )) 
    {
      throw 'Could not launch $_url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
  
}