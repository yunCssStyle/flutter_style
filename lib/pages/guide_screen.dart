import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/button/deco_button.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final List<String> imgList = [
    'assets/images/guide/guide1.png',
    'assets/images/guide/guide2.png',
    'assets/images/guide/guide3.png',
    'assets/images/guide/guide4.png',
    'assets/images/guide/guide5.png',
    'assets/images/guide/guide6.png',
    'assets/images/guide/guide7.png',
    'assets/images/guide/guide8.png',
  ];
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int _pageIndex = 0;

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      _pageIndex = index;
    });
  }

  void handleNext() {
    carouselController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void handlePrev() {
    carouselController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  final TextStyle _textStylePoint = TextStyle(
    color: const Color(0xFF8E01C4),
    fontFamily: 'Pretendard',
    fontSize: 24.w,
    fontWeight: FontWeight.w700,
  );
  final TextStyle _textStyleBlack = TextStyle(
    color: Colors.black,
    fontFamily: 'Pretendard',
    fontSize: 24.w,
    fontWeight: FontWeight.w700,
  );

  Widget renderText() {
    if (_pageIndex == 0) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '옷걸이는 제거 ',
          style: _textStylePoint,
          children: const <TextSpan>[
            TextSpan(
              text: ' 후 바닥에 두고 \n촬영해주세요.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    } else if (_pageIndex == 1) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '옷은 구겨지지않게 잘 펴서\n',
          style: _textStyleBlack,
          children: const <TextSpan>[
            TextSpan(
              text: '주름이 안생기도록 ',
              style: TextStyle(
                color: Color(0xFF8E01C4),
              ),
            ),
            TextSpan(
              text: '해주세요',
            ),
          ],
        ),
      );
    } else if (_pageIndex == 2) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '옷은 ',
          style: _textStyleBlack,
          children: const <TextSpan>[
            TextSpan(
              text: '잘리지 않게 ',
              style: TextStyle(
                color: Color(0xFF8E01C4),
              ),
            ),
            TextSpan(
              text: '카메라 틀에\n맞춰 촬영해주세요',
            ),
          ],
        ),
      );
    } else if (_pageIndex == 3) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '소매',
          style: _textStylePoint,
          children: const <TextSpan>[
            TextSpan(
              text: '는 몸판 뒤로 접고\n',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '소매 각도',
            ),
            TextSpan(
              text: '는 입은 형태처럼\n',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '내려서 ',
            ),
            TextSpan(
              text: '촬영해주세요',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    } else if (_pageIndex == 4) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '후드가 있는 경우\n',
          style: _textStyleBlack,
          children: const <TextSpan>[
            TextSpan(
              text: '뒤로접어 연출 ',
              style: TextStyle(
                color: Color(0xFF8E01C4),
              ),
            ),
            TextSpan(
              text: '해주세요',
            ),
          ],
        ),
      );
    } else if (_pageIndex == 5) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '셔츠나 블라우스 등의 경우\n',
          style: _textStyleBlack,
          children: const <TextSpan>[
            TextSpan(
              text: '지퍼와 단추를 채워서 ',
              style: TextStyle(
                color: Color(0xFF8E01C4),
              ),
            ),
            TextSpan(
              text: '촬영해주세요',
            ),
          ],
        ),
      );
    } else if (_pageIndex == 6) {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: '하의의 경우 ',
          style: _textStyleBlack,
          children: const <TextSpan>[
            TextSpan(
              text: '지퍼를\n채워서 ',
              style: TextStyle(
                color: Color(0xFF8E01C4),
              ),
            ),
            TextSpan(
              text: '촬영해주세요',
            ),
          ],
        ),
      );
    }
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: '지퍼를 열거나 닫는 등\n평소 ',
        style: _textStyleBlack,
        children: const <TextSpan>[
          TextSpan(
            text: '내가 즐겨입는대로\n연출 후 ',
            style: TextStyle(
              color: Color(0xFF8E01C4),
            ),
          ),
          TextSpan(
            text: '촬영해주세요',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        title: '내 옷 촬영 가이드',
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: imgList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIdx) {
                      return Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              imgList[index],
                              width: 334.w,
                              height: 338.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 35.w,
                              bottom: 20.w,
                            ),
                            child: renderText(),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: double.maxFinite,
                      onPageChanged: onPageChange,
                    ),
                  ),
                ),
              ),
              _pageIndex == 0
                  ? GestureDetector(
                      onTap: handleNext,
                      child: const DecoButton(
                        title: '다음',
                      ),
                    )
                  : (_pageIndex != imgList.length - 1)
                      ? SizedBox(
                          height: 70.0.w,
                          child: Row(children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: handlePrev,
                                child: const DecoButton(
                                  title: '이전',
                                ),
                              ),
                            ),
                            SizedBox(width: 1.0.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: handleNext,
                                child: const DecoButton(
                                  title: '다음',
                                ),
                              ),
                            ),
                          ]),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const DecoButton(
                            title: '닫기',
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
