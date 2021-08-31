import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_entity.dart';
import 'package:cybear_jinni/presentation/shared_widgets/top_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPageOfBlinds extends StatelessWidget {
  SettingsPageOfBlinds() {
    // for (final SmartRoomObject smartRoomObject in rooms) {
    //   for (final SmartDeviceObject smartLightObject
    //       in smartRoomObject.getLights()) {
    //     allSmartDeviceLightDevices.add(smartLightObject);
    //   }
    // }
  }

  final List<GenericLightDE> allSmartDeviceLightDevices = <GenericLightDE>[];

  @override
  Widget build(BuildContext context) {
    Widget tile(String roomName, String lightName) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(
              child: FaIcon(FontAwesomeIcons.solidLightbulb),
            ),
            title: Text(
              'Name:_',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color),
            ).tr(args: <String>[lightName]),
            subtitle: Text(
              'Room:_',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color),
            ).tr(args: <String>[roomName]),
            trailing: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.pen,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ],
      );
    }

    void backButtonFunction(BuildContext context) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        //  FontAwesomeIcons.plus,
        onPressed: () async {},
        child: const FaIcon(Icons.add),
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
              'Lights Settings',
              null,
              () {},
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: backButtonFunction,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        print('Delete the card');
                      }
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    child: tile(
                        allSmartDeviceLightDevices[index]
                            .roomName
                            .getOrCrash()!,
                        allSmartDeviceLightDevices[index]
                            .defaultName
                            .getOrCrash()!),
                  );
                },
                itemCount: allSmartDeviceLightDevices.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
