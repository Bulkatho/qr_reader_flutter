

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            },
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
  
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {

    //Leer provider.
    final uiProvider = Provider.of<UiProvider>(context);
    //Cambiar para mostrar pagina seleccionada
    final currentIndex = uiProvider.selectedMenuOption;

    //Usar el scanlist provider. -- no redibujar (false)
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    //TODO: temporal leer BD
    //final tempScan = new ScanModel(valor: 'http://solrex.cl');
    //dbHelper.getScanById(8).then((scan) => print(scan?.valor));
    //dbHelper.deleteAllScan().then(print);


    /*void _insert() async {
      await dbHelper.insert(tempScan);
    }*/
    

    switch(currentIndex){
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}