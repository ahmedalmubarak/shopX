import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopx/config/routes.dart';
import 'package:shopx/config/theme/app_colors.dart';
import 'package:shopx/services/local/cache_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  bool _isLastPage = false;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChange(int index, int modelDataLength) {
    if (index == modelDataLength - 1) {
      setState(() {
        _isLastPage = true;
      });
    } else {
      setState(() {
        _isLastPage = false;
      });
    }
  }

  void submitOnboardAndSaveIfCompleted() {
    CacheHelper.saveData(key: 'on-boarding', value: true).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, AppRoutes.loginPageRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageName = [
      'assets/images/problem-solving.png',
      'assets/images/support-team.png',
      'assets/images/ideas.png',
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: submitOnboardAndSaveIfCompleted,
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: AppColors.primary),
                    )),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageName.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                    onPageChange(index, imageName.length);
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) => OnboardContent(
                        title: 'Find the item you\'ve \nbeen looking for',
                        description:
                            'Here you\'ll see varieties of goods, carefully classified for seamless browsing experience',
                        image: imageName[index],
                      )),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    imageName.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isLastPage) {
                          submitOnboardAndSaveIfCompleted();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.primary : AppColors.primary.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String title, description, image;
  const OnboardContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: AppColors.grey,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
