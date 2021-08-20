import 'package:cybear_jinni/domain/vendors/i_vendor_repository.dart';
import 'package:cybear_jinni/domain/vendors/vendor.dart';
import 'package:cybear_jinni/domain/vendors/vendor_failures.dart';
import 'package:cybear_jinni/domain/vendors/vendor_value_objects.dart';
import 'package:cybear_jinni/infrastructure/core/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IVendorsRepository)
class VendorsRepository implements IVendorsRepository {
  @override
  Future<Either<VendorFailure, KtList<Vendor>>> getVendors() async {
    final List<Vendor> vendorsWithIcons = [];

    // Add icons to supported vendors and services
    for (final VendorsAndServices vendorsAndServices
        in VendorsAndServices.values) {
      if (vendorsAndServices.name ==
          VendorsAndServices.vendorsAndServicesNotSupported.name) {
        continue;
      }
      vendorsWithIcons
          .add(vendorPlusImageFromVandorName(vendorsAndServices.name));
      print(vendorsAndServices.name);
    }
    return right(vendorsWithIcons.toImmutableList());
  }

  Vendor vendorPlusImageFromVandorName(String vendorName) {
    for (final Vendor vendor
        in VendorsMocDataWithImages().getAllVendors().asList()) {
      if (vendor.name.getOrCrash().toLowerCase() == vendorName.toLowerCase()) {
        return vendor;
      }
    }

    return Vendor(
        name: VendorName(vendorName),
        image:
            'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.seilevel.com%2Frequirements%2Fwp-content%2Fplugins%2Fstormhill_author_page%2Fimg%2Fimage-not-found.png&f=1&nofb=1');
  }
}

class VendorsMocDataWithImages {
  KtList<Vendor> getAllVendors() {
    return [
      Vendor(
        name: VendorName('Tasmota'),
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.kyAWxT4tVBWL6O2sCJKqaAHaHa%26pid%3DApi&f=1',
      ),
      Vendor(
        name: VendorName('Sonoff'),
        image:
            'https://play-lh.googleusercontent.com/nfDq8xm5ueWPIZswiRD8PxzjmFAmOBgByV1CpFfAhau1_D_XCP2jW0EZ3VMEtZwbVRk=s180',
      ),
      Vendor(
        name: VendorName('MQTT'),
        image:
            'https://www.opc-router.de/wp-content/uploads/2018/07/mqtt_icon_128px.png',
      ),
      Vendor(
        name: VendorName('Tuya'),
        image:
            'https://play-lh.googleusercontent.com/KGM9NYnyox9TXwoaY3PKl1PfQ2rTPp1rnpNNtmlbgozJZykhZhGKsL3z9myoj4ccayLS=s180',
      ),
      Vendor(
        name: VendorName('Eufy'),
        image:
            'https://play-lh.googleusercontent.com/kTVQJspUeisuM03rNaLjdexsqsdz3Eh7dGAiL1WE_32HPHTjZmCELzsyym2LW3dY5fM=s180',
      ),
      Vendor(
        name: VendorName('Philips Hue'),
        image:
            'https://play-lh.googleusercontent.com/FUlW6h3cACamheiCHH1cE67irohAZq_dJ92irK92cryKwHUtY6ZTSv5d041qPZ9UOt3n=s180',
      ),
      Vendor(
        name: VendorName('Yeelight'),
        image:
            'https://play-lh.googleusercontent.com/bteU9OSFF9z596eUOkGgM3XpWF2-b1VsKvmwWFitaI4qMwVPmx3lS09fHFDx8-CX3Q=s180',
      ),
      Vendor(
        name: VendorName('ESPHome'),
        image:
            'https://pbs.twimg.com/profile_images/1099243589014573056/JuViMFXW_400x400.png',
      ),
      Vendor(
        name: VendorName('Ring'),
        image:
            'https://play-lh.googleusercontent.com/fbIl2IKPAG4_3lNnwsi0qMBTJEgOsIwBUYzrs5_GIRYRBHov_a5eJ0bMxEUNMu67G4Ws=s180',
      ),
    ].toImmutableList();
  }
}
