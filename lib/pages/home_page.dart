import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/providers/sql_helper.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/providers/db_provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

import 'package:qr_reader/models/scan_model.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    //final sliderEnable = themeProvider.sliderEnabled;

    bool _sliderEnabled = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.delete_forever_outlined)
          )
        ],
      ),
      body: _HomePageBody(),

     bottomNavigationBar: const CustomNavigationBar(),
     floatingActionButton: const ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {
  late DatabaseHandler handler;

  @override
  Widget build(BuildContext context) {

    //Leer provider.
    final uiProvider = Provider.of<UiProvider>(context);
    //Cambiar para mostrar pagina seleccionada
    final currentIndex = uiProvider.selectedMenuOption;
    
    //TODO: temporal leer BD
    final tempScan = new ScanModel(valor: 'http://solrex.cl');
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async{
      handler.nuevoScan(tempScan);
    });
    

    switch(currentIndex){
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}