import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cybear_jinni/domain/devices/device/devices_failures.dart';
import 'package:cybear_jinni/domain/devices/device/i_device_repository.dart';
import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'boilers_actor_bloc.freezed.dart';
part 'boilers_actor_event.dart';
part 'boilers_actor_state.dart';

@injectable
class BoilersActorBloc extends Bloc<BoilersActorEvent, BoilersActorState> {
  BoilersActorBloc(this._deviceRepository)
      : super(const BoilersActorState.initial());

  final IDeviceRepository _deviceRepository;

  @override
  Stream<BoilersActorState> mapEventToState(
    BoilersActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {},
      initialized: (e) async* {},
      turnOnAllBoilers: (_TurnOnAllBoilers value) async* {
        FlushbarHelper.createLoading(
          message: 'Turning On boiler',
          linearProgressIndicator: const LinearProgressIndicator(),
        ).show(value.context);

        _deviceRepository.turnOnDevices(devicesId: value.boilersIdToTurnUp);
      },
      turnOffAllBoilers: (_TurnOffAllBoilers value) async* {
        FlushbarHelper.createLoading(
          message: 'Turning Off boiler',
          linearProgressIndicator: const LinearProgressIndicator(),
        ).show(value.context);

        _deviceRepository.turnOffDevices(
            devicesId: value.boilersIdToTurnOff, forceUpdateLocation: 'R');
      },
    );
  }
}
