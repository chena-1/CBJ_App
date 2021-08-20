import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cybear_jinni/domain/devices/device/devices_failures.dart';
import 'package:cybear_jinni/domain/devices/device/i_device_repository.dart';
import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'device_actor_bloc.freezed.dart';
part 'device_actor_event.dart';
part 'device_actor_state.dart';

@injectable
class DeviceActorBloc extends Bloc<DeviceActorEvent, DeviceActorState> {
  DeviceActorBloc(this._deviceRepository)
      : super(const DeviceActorState.initial());

  final IDeviceRepository _deviceRepository;

  @override
  Stream<DeviceActorState> mapEventToState(
    DeviceActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {},
      initialized: (e) async* {},
      // yield const DeviceActorState.actionInProgress();
      // final possibleFailure = await _deviceRepository.delete(event.deviceEntity);
      // yield possibleFailure.fold(
      //   (f) => DeviceActorState.deleteFailure(f),
      //   (_) => const DeviceActorState.deleteSuccess(),
    );
  }
}
