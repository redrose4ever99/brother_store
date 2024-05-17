import 'package:brother_store/common/widgets/success_screen/success_screen.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOtp(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOtp(otp);
    isVerified
        ? Get.offAll(SuccessScreen(
            subTitle: "Congratulation",
            title: "Your phone verified successfully",
            image: TImages.wordBlack,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ))
        : Get.back();
  }
}
