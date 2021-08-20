import 'dart:async';

import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_entity.dart';
import 'package:cybear_jinni/presentation/shared_widgets/top_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// This page will show all the CyBear Jinni devices that have connected to the
/// hotspot of the app device.
class AddNewCBJDevices extends StatefulWidget {
  static List<GenericLightDE> newDevicesList = [];
  static List<String> newDevicesStringList = <String>[];

  @override
  State<StatefulWidget> createState() {
    return _AddNewCBJDevices();
  }
}

class _AddNewCBJDevices extends State<AddNewCBJDevices> {
  _AddNewCBJDevices() {
    // final CreateTheCBJAppServer createTheCBJAppServer = CreateTheCBJAppServer();
    // StreamController<SmartDeviceInfo> smartDeviceStream;
    //
    // createTheCBJAppServer.createServer(smartDeviceStream);
  }

  @override
  void initState() {
    super.initState();
    setStateTimer();
  }

  // List<SmartDeviceObject> newDevicesList = [];

  void setStateTimer() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        // newDevicesList = AddNewCBJDevices.newDevicesList;
      });
    });
  }

  void backButtonFunction(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: const <double>[0, 0, 0, 1],
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            TopNavigationBar(
              'Add New CyBear Jinni Devices',
              null,
              () {},
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: backButtonFunction,
            ),

            const SizedBox(
              height: 50,
            ),

            const Text(
              "Can't find any devices",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            // StreamBuilder(),
            // Expanded(
            //   child: ListView(
            //     children: newDevicesList.map((SmartDeviceObject newDevice) {
            //       return SmartDeviceToConfigure(newDevice);
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
