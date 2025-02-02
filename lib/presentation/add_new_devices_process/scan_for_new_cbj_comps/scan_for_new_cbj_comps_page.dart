import 'package:auto_route/auto_route.dart';
import 'package:cybear_jinni/application/cbj_comp/cbj_comp_bloc.dart';
import 'package:cybear_jinni/injection.dart';
import 'package:cybear_jinni/presentation/add_new_devices_process/scan_for_new_cbj_comps/widgets/scan_for_new_cbj_comps_widget.dart';
import 'package:cybear_jinni/presentation/routes/app_router.gr.dart';
import 'package:cybear_jinni/presentation/shared_widgets/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanForNewCBJCompsPage extends StatelessWidget {
  void leftIconFunction(BuildContext context) {
    context.router.replace(const ConnectToHomeWifiRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<CBJCompBloc>()..add(const CBJCompEvent.watchAllStarted()),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.black,
            brightness: Brightness.dark,
          ),
          body: Container(
            color: Colors.black87,
            child: Column(
              children: [
                TopNavigationBar(
                  'Add CBJ Devices',
                  null,
                  null,
                  leftIcon: FontAwesomeIcons.arrowLeft,
                  leftIconFunction: leftIconFunction,
                ),
                Expanded(
                  child: ScanForNewCBJCompsWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
