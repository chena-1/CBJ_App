import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cybear_jinni/application/auth/auth_bloc.dart';
import 'package:cybear_jinni/application/boilers/boilers_watcher/boilers_watcher_bloc.dart';
import 'package:cybear_jinni/application/devices/device_actor/device_actor_bloc.dart';
import 'package:cybear_jinni/injection.dart';
import 'package:cybear_jinni/presentation/core/theme_data.dart';
import 'package:cybear_jinni/presentation/device_full_screen_page/boilers/settings_page_of_boilers.dart';
import 'package:cybear_jinni/presentation/device_full_screen_page/boilers/widgets/rooms_boilers_widget.dart';
import 'package:cybear_jinni/presentation/routes/app_router.gr.dart';
import 'package:cybear_jinni/presentation/shared_widgets/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Boilers page that will call the lamps widget file and add background
/// and scaffold for it
class RoomsBoilersPage extends StatelessWidget {
  const RoomsBoilersPage(
      {this.showDevicesOnlyFromRoomId, this.roomColorGradiant});

  /// If it have value will only show boilers in this room
  final String? showDevicesOnlyFromRoomId;
  final List<Color>? roomColorGradiant;

  void cogFunction(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => SettingsPageOfBoilers()));
  }

  void backButtonFunction(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BoilersWatcherBloc>(
          create: (context) => getIt<BoilersWatcherBloc>()
            ..add(const BoilersWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<DeviceActorBloc>(
          create: (context) => getIt<DeviceActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    context.router.replace(const ConnectToHubRoute()),
                orElse: () {},
              );
            },
          ),
          BlocListener<DeviceActorBloc, DeviceActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: 'Error',
                    // state.devicesFailure.map(
                    //   unexpected: (_) =>
                    //       'Unexpected error occured while deleting,' +
                    //       'please contact support.',
                    //   insufficientPermission: (_) =>
                    //       'Insufficient permissions ❌',
                    //   unableToUpdate: (_) => 'Impossible error',
                    // ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.black,
            brightness: Brightness.dark,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: BacgroundGradient.getBacground(context),
            ),
            child: Column(
              children: [
                TopNavigationBar(
                  'Boilers',
                  Icons.more_vert,
                  cogFunction,
                  leftIcon: FontAwesomeIcons.arrowLeft,
                  leftIconFunction: backButtonFunction,
                  rightSecondIcon: FontAwesomeIcons.search,
                  rightSecondFunction: () {},
                ),
                Expanded(
                  child: RoomsBoilersWidget(
                      showDevicesOnlyFromRoomId!, roomColorGradiant!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
