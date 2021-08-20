import 'dart:async';
import 'dart:io';

import 'package:cybear_jinni/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:cybear_jinni/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:cybear_jinni/domain/cbj_comp/i_cbj_comp_repository.dart';
import 'package:cybear_jinni/domain/create_home/i_create_home_repository.dart';
import 'package:cybear_jinni/domain/devices/abstract_device/value_objects_core.dart';
import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_entity.dart';
import 'package:cybear_jinni/domain/devices/generic_light_device/generic_light_value_objects.dart';
import 'package:cybear_jinni/domain/manage_network/i_manage_network_repository.dart';
import 'package:cybear_jinni/domain/manage_network/manage_network_entity.dart';
import 'package:cybear_jinni/domain/user/user_entity.dart';
import 'package:cybear_jinni/infrastructure/core/gen/cbj_app_server/cbj_app_server_d.dart';
import 'package:cybear_jinni/infrastructure/core/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cybear_jinni/infrastructure/core/gen/security_bear/client/protoc_as_dart/security_bear_connections.pbgrpc.dart';
import 'package:cybear_jinni/infrastructure/core/gen/security_bear/client/security_bear_server_client.dart';
import 'package:cybear_jinni/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info/device_info.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: ICBJCompRepository)
class CBJCompRepository implements ICBJCompRepository {
  @override
  Future<Either<CBJCompFailure, Unit>> shutdownServer() async {
    await CreateTheCBJAppServer.shoutDownServer();
    return right(unit);
  }

  @override
  Future<Either<CBJCompFailure, Unit>> firstSetup(
      CBJCompEntity cBJCompEntity) async {
    try {
      // final CompInfo compInfo = await compEntityToCompInfo(cBJCompEntity);
      //
      // final UserEntity deviceUser =
      //     (await getIt<ICreateHomeRepository>().getDeviceUserFromHome())
      //         .getOrElse(() => throw "Device user can't be found");
      //
      // final String fireBaseProjectId = ConstantCredentials.fireBaseProjectId;
      // final String fireBaseApiKey = ConstantCredentials.fireBaseApiKey;
      // final String userEmail = deviceUser.email!.getOrCrash();
      // final String userPassword = deviceUser.pass!.getOrCrash();
      // final String homeId = (await getIt<IAuthFacade>().getCurrentHome())
      //     .getOrElse(() => throw MissingCurrentHomeError())
      //     .id
      //     .getOrCrash()!;
      //
      // final FirebaseAccountInformation firebaseAccountInformation =
      //     FirebaseAccountInformation()
      //       ..fireBaseProjectId = fireBaseProjectId
      //       ..fireBaseApiKey = fireBaseApiKey
      //       ..userEmail = userEmail
      //       ..userPassword = userPassword
      //       ..homeId = homeId;
      //
      // final FirstSetupMessage firstSetupMessage = FirstSetupMessage(
      //     compInfo: compInfo,
      //     firebaseAccountInformation: firebaseAccountInformation);
      //
      // final CommendStatus commendStatus = await SmartClient.compFirstSetup(
      //     cBJCompEntity.lastKnownIp!.getOrCrash(), firstSetupMessage);
      //
      // if (commendStatus.success) {
      //   return right(unit);
      // }
      return left(const CBJCompFailure.unexpected());
    } catch (e) {
      return left(const CBJCompFailure.unexpected());
    }
  }

  @override
  Future<Either<CBJCompFailure, Unit>> create(CBJCompEntity deviceEntity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<CBJCompFailure, Unit>> devicesList(CBJCompEntity deviceEntity) {
    // TODO: implement devicesList
    throw UnimplementedError();
  }

  @override
  Future<Either<CBJCompFailure, Unit>> updateCompInfo(
      CBJCompEntity compEntity) async {
    try {
      // final CompInfo compInfo = await compEntityToCompInfo(compEntity);
      //
      // final CommendStatus commendStatus = await SmartClient.setCompInfo(
      //     compEntity.lastKnownIp!.getOrCrash(), compInfo);
      //
      // if (commendStatus.success) {
      //   return right(unit);
      // }
      return left(const CBJCompFailure.unexpected());
    } catch (e) {
      return left(const CBJCompFailure.unexpected());
    }
  }

  @override
  Stream<Either<CBJCompFailure, String>> getConnectedComputersIP() async* {
    try {
      final CreateTheCBJAppServer createTheCBJAppServer =
          CreateTheCBJAppServer();

      // final StreamController<CompInfoSB> compInfoSBSteam =
      //     StreamController<CompInfoSB>();
      //
      // createTheCBJAppServer.createServer(compInfoSBSteam);
      //
      // yield* compInfoSBSteam.stream.map((CompInfoSB compInfoSB) {
      //   return right(compInfoSB.compIP);
      // });
    } catch (e) {
      yield left(const CBJCompFailure.unexpected());
    }
    yield left(const CBJCompFailure.unexpected());
  }

  @override
  Future<Either<CBJCompFailure, CBJCompEntity>> getInformationFromDeviceByIp(
      String compIp) async {
    try {
      // final CompInfo compInfo = await SmartClient.getCompInfo(compIp);
      //
      // final CompSpecs compSpecs = compInfo.compSpecs;
      //
      // final KtList<GenericLightDE> deviceEntityList =
      //     compDevicesToDevicesList(compInfo, compIp);
      //
      // final CBJCompEntity cbjCompEntity = CBJCompEntity(
      //   id: CBJCompUniqueId.fromUniqueString(compSpecs.compId),
      //   roomId: CBJCompRoomId(),
      //   compUuid: CBJCompUuid(compInfo.compSpecs.compUuid),
      //   lastKnownIp: CBJCompLastKnownIp(compIp),
      //   cBJCompDevices: CBJCompDevices(deviceEntityList),
      // );
      //
      // return right(cbjCompEntity);
    } catch (e) {
      return left(const CBJCompFailure.unexpected());
    }
    return left(const CBJCompFailure.unexpected());
  }

  @override
  Future<Either<CBJCompFailure, Unit>> setFirebaseAccountInformation(
      CBJCompEntity compEntity) async {
    try {
      final UserEntity deviceUser =
          (await getIt<ICreateHomeRepository>().getDeviceUserFromHome())
              .getOrElse(() => throw "Device user can't be found");

      // final CommendStatus commendStatus =
      //     (await SmartClient.setFirebaseAccountInformationFlutter(
      //   compEntity.lastKnownIp!.getOrCrash(),
      //   deviceUser,
      // ))!;

      CommendStatus commendStatus = CommendStatus(success: false);

      final ManageNetworkEntity manageWiFiEntity =
          IManageNetworkRepository.manageWiFiEntity!;

      if (manageWiFiEntity == null) {
        return left(const CBJCompFailure.unexpected());
      }

      final SBCommendStatus sbCommendStatus =
          (await SecurityBearServerClient.setFirebaseAccountInformation(
              compEntity.lastKnownIp!.getOrCrash(), manageWiFiEntity))!;

      if (commendStatus.success) {
        return right(unit);
      }
      return left(const CBJCompFailure.unexpected());
    } catch (e) {
      return left(const CBJCompFailure.unexpected());
    }
  }

  Future<CompInfo> compEntityToCompInfo(CBJCompEntity compEntity) async {
    String deviceModelString = 'No Model found';
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo.model);
      deviceModelString = androidInfo.model;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print(iosInfo.utsname.machine);
      deviceModelString = iosInfo.model;
    }

    final CompSpecs compSpecs = CompSpecs(
      compUuid: compEntity.compUuid!.getOrCrash(),
      compId: compEntity.id.getOrCrash(),
      pubspecYamlVersion: '',
    );

    final List<SmartDeviceInfo> smartDevicesList = [];

    final DeviceActions deviceAction = DeviceActions.actionNotSupported;
    final DeviceStateGRPC deviceStateGRPC = DeviceStateGRPC.waitingInComp;

    compEntity.cBJCompDevices!.getOrCrash().forEach((GenericLightDE element) {
      final DeviceTypesActions deviceTypesActions = DeviceTypesActions(
        deviceAction: deviceAction,
        deviceStateGRPC: deviceStateGRPC,
      );

      final SmartDeviceInfo smartDeviceInfo = SmartDeviceInfo(
        compSpecs: compSpecs,
        deviceTypesActions: deviceTypesActions,
        defaultName: element.defaultName.getOrCrash(),
        senderId: element.senderId.getOrCrash(),
        senderDeviceModel: deviceModelString,
        senderDeviceOs: Platform.operatingSystem,
        state: element.deviceStateGRPC.getOrCrash(),
        stateMassage: 'Setting up device',
        roomId: element.roomId.getOrCrash(),
        id: element.uniqueId.getOrCrash(),
        serverTimeStamp: DateTime.now().toString(),
      );
      smartDevicesList.add(smartDeviceInfo);
    });

    final CompInfo compInfo = CompInfo(
      compSpecs: compSpecs,
      smartDevicesInComp: smartDevicesList,
    );
    return compInfo;
  }

  KtList<GenericLightDE> compDevicesToDevicesList(
      CompInfo compInfo, String compIp) {
    final List<GenericLightDE> deviceEntityList = [];

    for (final SmartDeviceInfo smartDeviceInfo in compInfo.smartDevicesInComp) {
      final GenericLightDE deviceEntity = GenericLightDE(
          uniqueId: CoreUniqueId.fromUniqueString(smartDeviceInfo.id),
          defaultName: DeviceDefaultName(smartDeviceInfo.defaultName),
          roomId: CoreUniqueId.fromUniqueString(smartDeviceInfo.roomId),
          roomName: DeviceRoomName('Missing room name'),
          deviceStateGRPC: DeviceState(
              smartDeviceInfo.deviceTypesActions.deviceStateGRPC.toString()),
          stateMassage: DeviceStateMassage(smartDeviceInfo.stateMassage),
          senderDeviceOs: DeviceSenderDeviceOs(smartDeviceInfo.senderDeviceOs),
          senderDeviceModel:
              DeviceSenderDeviceModel(smartDeviceInfo.senderDeviceModel),
          senderId: DeviceSenderId.fromUniqueString(smartDeviceInfo.senderId),
          deviceVendor: DeviceVendor(
              VendorsAndServices.vendorsAndServicesNotSupported.toString()),
          lightSwitchState: GenericLightSwitchState(
              smartDeviceInfo.deviceTypesActions.deviceAction.toString()),
          compUuid: DeviceCompUuid(smartDeviceInfo.compSpecs.compUuid));
      deviceEntityList.add(deviceEntity);
    }
    return deviceEntityList.toImmutableList();
  }

  @override
  Future<Either<CBJCompFailure, Unit>> setSecurityBearWiFiInformation(
    CBJCompEntity compEntity,
  ) async {
    try {
      final ManageNetworkEntity firstWifiEntityOrFailure =
          (await getIt<ICreateHomeRepository>().getFirstWifi())
              .getOrElse(() => throw 'Error');

      final ManageNetworkEntity secondWifiEntityOrFailure =
          IManageNetworkRepository.manageWiFiEntity!;
      if (secondWifiEntityOrFailure == null) {
        print('No second Wifi Entity, it is going to crash');
      }

      final SBCommendStatus commendStatus =
          await SecurityBearServerClient.setWiFisInformation(
              compEntity.lastKnownIp!.getOrCrash(),
              firstWifiEntityOrFailure.name!.getOrCrash(),
              firstWifiEntityOrFailure.pass!.getOrCrash(),
              secondWifiEntityOrFailure.name!.getOrCrash(),
              secondWifiEntityOrFailure.pass!.getOrCrash());

      if (commendStatus.success) {
        return right(unit);
      }
      return left(const CBJCompFailure.unexpected());
    } catch (e) {
      return left(const CBJCompFailure.unexpected());
    }
  }
}
