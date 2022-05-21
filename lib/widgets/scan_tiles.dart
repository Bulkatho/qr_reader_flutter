import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'package:qr_reader/utils/utils.dart';



class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({ 
    Key? key, 
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: true);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          //Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!);
          scanListProvider.borrarScanPorId(scans[i].id!);
        },
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(
            tipo == 'http'
            ? Icons.desktop_windows_rounded
            : Icons.map_outlined,
            color: Theme.of(context).primaryColor
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined, 
            color: Colors.blue
          ),
          onTap: () => launchInBrowser(context , scans[i]),
        ),
      )
    );
  }
}
