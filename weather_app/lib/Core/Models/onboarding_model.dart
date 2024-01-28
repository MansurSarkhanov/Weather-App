import '../../Product/Constants/app_strings.dart';
import '../../Product/Utility/Extension/image_path_extension.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;

  OnboardingModel({required this.title, required this.subtitle, required this.image});
}
List<OnboardingModel> onboardingModel = [
  OnboardingModel(
      image: ImagePath.cloud.toPath(), title: AppStrings.onboardingTitle1, subtitle: AppStrings.onboardingSubTitle1),
  OnboardingModel(
      image: ImagePath.sun.toPath(), title: AppStrings.onboardingTitle2, subtitle: AppStrings.onboardingSubTitle2),
  OnboardingModel(
      image: ImagePath.rain.toPath(), title: AppStrings.onboardingTitle3, subtitle: AppStrings.onboardingSubTitle3),
  OnboardingModel(
      image: ImagePath.suncloud.toPath(), title: AppStrings.onboardingTitle3, subtitle: AppStrings.onboardingSubTitle3)
];
