import 'package:aerium/core/utils/extensions.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/infrastructure/bloc/email_bloc.dart';
import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets_1/aerium_button.dart';
import 'package:aerium/presentation/widgets_1/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets_1/aerium_text_form_field.dart';
import 'package:aerium/presentation/widgets_1/content_area.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';

class ContactPage extends StatefulWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;
  final MusicController musicController;

  const ContactPage({Key? key, required this.musicController})
      : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late EmailBloc emailBloc;
  bool isSendingEmail = false;
  bool isBodyVisible = false;
  bool _nameFilled = false;
  bool _emailFilled = false;
  bool _subjectFilled = false;
  bool _messageFilled = false;
  bool _nameHasError = false;
  bool _emailHasError = false;
  bool _subjectHasError = false;
  bool _messageHasError = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.ease),
      ),
    );
    emailBloc = getIt<EmailBloc>();
    super.initState();
    _saveLastVisitedPage();
  }

  _saveLastVisitedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastVisitedPage', StringConst.CONTACT_PAGE);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isFormValid() {
    return _nameFilled && _subjectFilled && _messageFilled && _emailFilled;
  }

  void sendEmail() {
    if (isFormValid()) {
      setState(() {
        isSendingEmail = true;
      });
      emailBloc.add(
        SendEmail(
          name: _nameController.text,
          email: _emailController.text,
          subject: _subjectController.text,
          message: _messageController.text,
        ),
      );
    } else {
      isNameValid(_nameController.text);
      isEmailValid(_emailController.text);
      isSubjectValid(_subjectController.text);
      isMessageValid(_messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? initialErrorStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.white,
      fontSize: Sizes.TEXT_SIZE_12,
    );
    TextStyle? errorStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.errorRed,
      fontWeight: FontWeight.w400,
      fontSize: Sizes.TEXT_SIZE_12,
      letterSpacing: 1,
    );
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8), // عرض بیشتر برای موبایل
      assignWidth(context, 0.6),
    );

    double buttonWidth = responsiveSize(
      context,
      contentAreaWidth * 0.8, // عرض بیشتر برای موبایل
      contentAreaWidth * 0.25,
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.05), // پدینگ کمتر برای موبایل
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.05), // پدینگ کمتر برای موبایل
        assignWidth(context, 0.15),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.18), // پدینگ کمتر برای موبایل
        assignHeight(context, 0.3),
      ),
    );
    TextStyle? headingStyle = textTheme.displayMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(context, 30, 60), // فونت کوچک‌تر برای موبایل
    );
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600; // تشخیص دستگاه موبایل

    return BlocConsumer<EmailBloc, EmailState>(
        bloc: emailBloc,
        listener: (context, state) {
          if (state == EmailState.failure()) {
            setState(() {
              isSendingEmail = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.errorRed,
                content: Text(
                  StringConst.EMAIL_FAILED_RESPONSE,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    color: AppColors.black,
                  ),
                ),
                duration: Animations.emailSnackBarDuration,
              ),
            );
          }
          if (state == EmailState.emailSentSuccessFully()) {
            setState(() {
              isSendingEmail = false;
            });
            clearText();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.white,
                content: Text(
                  StringConst.EMAIL_RESPONSE,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    color: AppColors.black,
                  ),
                ),
                duration: Animations.emailSnackBarDuration,
              ),
            );
          }
        },
        builder: (context, state) {
          return PageWrapper(
            musicController: widget.musicController,
            selectedRoute: ContactPage.contactPageRoute,
            selectedPageName: '',
            navBarAnimationController: _controller,
            onLoadingAnimationDone: () {
              _controller.forward();
            },
            child: Stack(
              children: [
                // background image
                Container(
                  color: AppColors.appBackgroundColor,
                  width: size.width,
                  height: size.height,
                  child: Center(
                    child: ClipRRect(
                      child: Image.asset(
                        ImagePath.badsaba_light,
                        width: isMobile
                            ? size.width / 2
                            : size.width / 3, // تصویر کوچک‌تر برای موبایل
                        height: isMobile
                            ? size.height / 3
                            : size.height / 2, // تصویر کوچک‌تر برای موبایل
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // main of contact
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [
                      Padding(
                        padding: padding,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal:
                                isMobile ? 20 : 50, // پدینگ کمتر برای موبایل
                          ),
                          decoration: BoxDecoration(
                            color:
                                AppColors.appBackgroundColor.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.appBackgroundColor
                                    .withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                                color: AppColors.appBackgroundColorOpposite,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ContentArea(
                            width: contentAreaWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedTextSlideBoxTransition(
                                  controller: _controller,
                                  text: StringConst.GET_IN_TOUCH,
                                  textStyle: headingStyle,
                                ),
                                CustomSpacer(heightFactor: 0.05),
                                AnimatedPositionedText(
                                  width: contentAreaWidth,
                                  controller: CurvedAnimation(
                                    parent: _controller,
                                    curve: Interval(0.6, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                  text: StringConst.CONTACT_MSG,
                                  maxLines: 5,
                                  textStyle: textTheme.bodyLarge?.copyWith(
                                    color: AppColors.grey700,
                                    height: 2.0,
                                    fontSize: responsiveSize(
                                      context,
                                      Sizes
                                          .TEXT_SIZE_14, // فونت کوچک‌تر برای موبایل
                                      Sizes.TEXT_SIZE_18,
                                    ),
                                  ),
                                ),
                                CustomSpacer(heightFactor: 0.05),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: Column(
                                    children: [
                                      AeriumTextFormField(
                                        hasTitle: _nameHasError,
                                        title: StringConst.NAME_ERROR_MSG,
                                        titleStyle: _nameHasError
                                            ? errorStyle
                                            : initialErrorStyle,
                                        hintText: StringConst.YOUR_NAME,
                                        controller: _nameController,
                                        filled: _nameFilled,
                                        onChanged: (value) {
                                          isNameValid(value);
                                        },
                                      ),
                                      SpaceH20(),
                                      AeriumTextFormField(
                                        hasTitle: _emailHasError,
                                        title: StringConst.EMAIL_ERROR_MSG,
                                        titleStyle: _emailHasError
                                            ? errorStyle
                                            : initialErrorStyle,
                                        hintText: StringConst.EMAIL,
                                        controller: _emailController,
                                        filled: _emailFilled,
                                        onChanged: (value) {
                                          isEmailValid(value);
                                        },
                                      ),
                                      SpaceH20(),
                                      AeriumTextFormField(
                                        hasTitle: _subjectHasError,
                                        title: StringConst.SUBJECT_ERROR_MSG,
                                        titleStyle: _subjectHasError
                                            ? errorStyle
                                            : initialErrorStyle,
                                        hintText: StringConst.SUBJECT,
                                        controller: _subjectController,
                                        filled: _subjectFilled,
                                        onChanged: (value) {
                                          isSubjectValid(value);
                                        },
                                      ),
                                      SpaceH20(),
                                      AeriumTextFormField(
                                        hasTitle: _messageHasError,
                                        title: StringConst.MESSAGE_ERROR_MSG,
                                        titleStyle: _messageHasError
                                            ? errorStyle
                                            : initialErrorStyle,
                                        hintText: StringConst.MESSAGE,
                                        controller: _messageController,
                                        filled: _messageFilled,
                                        textInputType: TextInputType.multiline,
                                        maxLines: 10,
                                        onChanged: (value) {
                                          isMessageValid(value);
                                        },
                                      ),
                                      SpaceH20(),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: AeriumButton(
                                          buttonStyle: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Sizes.RADIUS_8),
                                            )),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors.background),
                                            surfaceTintColor:
                                                MaterialStateProperty.all(
                                                    AppColors.background),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    AppColors.white),
                                          ),
                                          height: Sizes.HEIGHT_56,
                                          width: buttonWidth,
                                          buttonColor: AppColors.background,
                                          isLoading: isSendingEmail,
                                          title: StringConst.SEND_MESSAGE
                                              .toUpperCase(),
                                          onPressed: sendEmail,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(
                          heightFactor:
                              isMobile ? 0.1 : 0.15), // فاصله کمتر برای موبایل
                      SimpleFooter(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  bool isTextValid(String value) {
    if (value.length > 0) {
      return true;
    }
    return false;
  }

  void isNameValid(String name) {
    bool isValid = isTextValid(name);
    setState(() {
      _nameFilled = isValid;
      _nameHasError = !isValid;
    });
  }

  void isEmailValid(String email) {
    bool isValid = email.isValidEmail();
    setState(() {
      _emailFilled = isValid;
      _emailHasError = !isValid;
    });
  }

  void isSubjectValid(String subject) {
    bool isValid = isTextValid(subject);
    setState(() {
      _subjectFilled = isValid;
      _subjectHasError = !isValid;
    });
  }

  void isMessageValid(String message) {
    bool isValid = isTextValid(message);
    setState(() {
      _messageFilled = isValid;
      _messageHasError = !isValid;
    });
  }

  void clearText() {
    _nameController.text = "";
    _emailController.text = "";
    _subjectController.text = "";
    _messageController.text = "";
  }
}
