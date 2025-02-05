part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    // products
    NavItemData(name: StringConst.PRODUCTS, route: StringConst.PRODUCT_PAGE),
    //
    // NavItemData(
    //   name: StringConst.EXPERIENCE,
    //   route: StringConst.EXPERIENCE_PAGE,
    // ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    //TODO social media
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<String> mobileTechnologies = [
    "Android",
    "Kotlin",
    "Jetpack Compose",
    "Flutter",
    "Dart"
        "Java Android",
  ];

  static List<String> otherTechnologies = [
    "HTML 5",
    "CSS 3",
    "JavaScript",
    "Typescript",
    "React JS",
    "Next JS",
    "Node JS",
    "Git",
    "AWS",
    "Docker",
    "Kubernetes",
    "Google Cloud",
    "Azure",
    "Travis CI",
    "Circle CI",
    "Express",
    "Chakra UI",
    "Laravel",
    "PHP",
    "SQL",
    "C++",
    "Firebase",
    "Figma",
    "Adobe XD",
    "Wordpress",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.DISNEY_PLUS,
    Projects.FLUTTER_CATALOG,
    Projects.DROP,
    Projects.ROAM,
    Projects.LOGIN_CATALOG,
    // Projects.FOODY_BITE,
    Projects.NIMBUS,
  ];

  static List<ProjectItemData> projects = [
    Projects.DISNEY_PLUS,
    Projects.FLUTTER_CATALOG,
    Projects.DROP,
    Projects.ROAM,
    Projects.LOGIN_CATALOG,
    // Projects.FOODY_BITE,
    Projects.NIMBUS,
    Projects.OTP_TEXT_FIELD,
    Projects.AERIUM,
    Projects.AERIUM_V2,
    Projects.OUTFITR,
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
      projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
      gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SERVERLESS_TODO,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.SERVERLESS_TODO_TECH,
      projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
      gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_ALGORITHMS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
      gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
      gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.ONBOARDING_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.ONBOARDING_APP_DETAIL,
      gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.FINOPP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.FINOPP_DETAIL,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.AMOR_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.AMOR_APP_DETAIL,
      gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
      webUrl: StringConst.AMOR_APP_WEB_URL,
      isLive: true,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.MSC_IT,
      url: StringConst.CMU_CERT_URL,
      image: ImagePath.CMU_MASTERS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.CMU,
    ),
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.325,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.CLOUD_DEVELOPER,
      url: StringConst.CLOUD_DEVELOPER_URL,
      image: ImagePath.CLOUD_DEVELOPER_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: StringConst.POSITION_5,
      companyUrl: StringConst.COMPANY_5_URL,
      roles: [
        StringConst.COMPANY_5_ROLE_1,
        StringConst.COMPANY_5_ROLE_2,
        StringConst.COMPANY_5_ROLE_3,
      ],
      location: StringConst.LOCATION_5,
      duration: StringConst.DURATION_5,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
  ];
}

class Projects {
  static ProjectItemData DISNEY_PLUS = ProjectItemData(
    title: StringConst.DISNEY_PLUS,
    subtitle: StringConst.DISNEY_PLUS,
    platform: StringConst.DISNEY_PLUS_PLATFORM,
    primaryColor: AppColors.disneyPlus,
    image: ImagePath.DISNEY_PLUS_COVER,
    coverUrl: ImagePath.DISNEY_PLUS_SCREENS,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.flutterCatalogAppLogo,
    projectAssets: [
      ImagePath.DISNEY_PLUS_1,
      ImagePath.DISNEY_PLUS_2,
      ImagePath.DISNEY_PLUS_3,
      ImagePath.DISNEY_PLUS_4,
      ImagePath.DISNEY_PLUS_5,
      ImagePath.DISNEY_PLUS_6,
      ImagePath.DISNEY_PLUS_7,
      ImagePath.DISNEY_PLUS_8,
      ImagePath.DISNEY_PLUS_9,
      ImagePath.DISNEY_PLUS_10,
      ImagePath.DISNEY_PLUS_11,
      ImagePath.DISNEY_PLUS_12,
      ImagePath.DISNEY_PLUS_13,
    ],
    category: StringConst.DISNEY_PLUS_CATEGORY,
    portfolioDescription: StringConst.DISNEY_PLUS_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.JETPACK_COMPOSE,
    gitHubUrl: StringConst.DISNEY_PLUS_GITHUB_URL,
    playStoreUrl: StringConst.DISNEY_PLUS_PLAYSTORE_URL,
  );
  static ProjectItemData FLUTTER_CATALOG = ProjectItemData(
    title: StringConst.FLUTTER_CATALOG,
    subtitle: StringConst.FLUTTER_CATALOG,
    platform: StringConst.FLUTTER_CATALOG_PLATFORM,
    primaryColor: AppColors.flutter_catalog,
    image: ImagePath.FLUTTER_CATALOG_COVER,
    coverUrl: ImagePath.FLUTTER_CATALOG_COVER,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.flutterCatalogAppLogo,
    projectAssets: [
      ImagePath.FLUTTER_CATALOG_SCREENS,
      ImagePath.FLUTTER_CATALOG_1,
      ImagePath.FLUTTER_CATALOG_2,
      ImagePath.FLUTTER_CATALOG_3,
      ImagePath.FLUTTER_CATALOG_4,
      ImagePath.FLUTTER_CATALOG_5,
    ],
    category: StringConst.FLUTTER_CATALOG_CATEGORY,
    portfolioDescription: StringConst.FLUTTER_CATALOG_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.FLUTTER_CATALOG_GITHUB_URL,
    playStoreUrl: StringConst.FLUTTER_CATALOG_PLAYSTORE_URL,
  );
  static ProjectItemData DROP = ProjectItemData(
    title: StringConst.DROP,
    subtitle: StringConst.DROP,
    platform: StringConst.DROP_PLATFORM,
    primaryColor: AppColors.drop,
    image: ImagePath.DROP_COVER,
    category: StringConst.DROP_CATEGORY,
    designer: StringConst.DROP_DESIGNER,
    coverUrl: ImagePath.DROP_COVER,
    navTitleColor: AppColors.dropNavTitle,
    navSelectedTitleColor: AppColors.dropSelectedNavTitle,
    appLogoColor: AppColors.dropAppLogo,
    projectAssets: [
      ImagePath.DROP_DESC,
      ImagePath.DROP_FLOW_CHART,
      ImagePath.DROP_WIREFRAMES,
      ImagePath.DROP_MINIMAL_DESIGN,
      ImagePath.DROP_EASY_ACCESS,
      ImagePath.DROP_SIMPLE,
      ImagePath.DROP_THANKS,
    ],
    portfolioDescription: StringConst.DROP_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.DROP_GITHUB_URL,
    playStoreUrl: StringConst.DROP_PLAYSTORE_URL,
  );
  static ProjectItemData ROAM = ProjectItemData(
    title: StringConst.ROAM,
    subtitle: StringConst.ROAM,
    primaryColor: AppColors.roam,
    category: StringConst.ROAM_CATEGORY,
    designer: StringConst.ROAM_DESIGNER,
    platform: StringConst.ROAM_PLATFORM,
    image: ImagePath.ROAM_COVER,
    coverUrl: ImagePath.ROAM_COVER,
    navTitleColor: AppColors.roamNavTitle,
    navSelectedTitleColor: AppColors.roamSelectedNavTitle,
    appLogoColor: AppColors.roamAppLogo,
    projectAssets: [
      ImagePath.ROAM_OVERALL,
      ImagePath.ROAM_ONBOARDING,
      ImagePath.ROAM_HOME,
      ImagePath.ROAM_EXPLORE,
      ImagePath.ROAM_PROFILE,
      ImagePath.ROAM_FLOW_CHART,
      ImagePath.ROAM_WIREFRAMES_1,
      ImagePath.ROAM_WIREFRAMES_2,
      ImagePath.ROAM_WIREFRAMES_3,
    ],
    portfolioDescription: StringConst.ROAM_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.ROAM_GITHUB_URL,
    playStoreUrl: StringConst.ROAM_PLAYSTORE_URL,
  );
  static ProjectItemData LOGIN_CATALOG = ProjectItemData(
    title: StringConst.LOGIN_CATALOG,
    primaryColor: AppColors.login_catalog,
    subtitle: StringConst.LOGIN_CATALOG,
    category: StringConst.LOGIN_CATALOG_CATEGORY,
    platform: StringConst.LOGIN_CATALOG_PLATFORM,
    image: ImagePath.LOGIN_CATALOG_COVER,
    coverUrl: ImagePath.LOGIN_CATALOG_COVER,
    portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
    navTitleColor: AppColors.loginCatalogNavTitle,
    navSelectedTitleColor: AppColors.loginCatalogSelectedNavTitle,
    appLogoColor: AppColors.loginCatalogAppLogo,
    projectAssets: [
      ImagePath.LOGIN_DESIGN_4,
      ImagePath.LOGIN_DESIGN_5,
      ImagePath.LOGIN_DESIGN_7,
      ImagePath.LOGIN_DESIGN_8,
      ImagePath.LOGIN_DESIGN_9,
    ],
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
    playStoreUrl: StringConst.LOGIN_CATALOG_PLAYSTORE_URL,
  );
  // static ProjectItemData FOODY_BITE = ProjectItemData(
  //   title: StringConst.FOODY_BITE,
  //   subtitle: StringConst.FOODY_BITE_SUBTITLE,
  //   category: StringConst.FOODY_BITE_CATEGORY,
  //   designer: StringConst.FOODY_BITE_DESIGNER,
  //   primaryColor: AppColors.foodybite,
  //   platform: StringConst.FOODY_BITE_PLATFORM,
  //   image: ImagePath.FOODY_BITE_COVER,
  //   coverUrl: ImagePath.FOODY_BITE_COVER,
  //   navTitleColor: AppColors.foodybiteNavTitle,
  //   navSelectedTitleColor: AppColors.foodybiteSelectedNavTitle,
  //   appLogoColor: AppColors.foodybiteAppLogo,
  //   projectAssets: [
  //     ImagePath.FOODY_BITE_HOME,
  //     ImagePath.FOODY_BITE_STARTING_FLOW,
  //     ImagePath.FOODY_BITE_HOME_FLOW,
  //     ImagePath.FOODY_BITE_REVIEW_FLOW,
  //     ImagePath.FOODY_BITE_TYPOGRAPHY,
  //   ],
  //   portfolioDescription: StringConst.FOODY_BITE_DETAIL,
  //   isPublic: true,
  //   isOnPlayStore: true,
  //   technologyUsed: StringConst.FLUTTER,
  //   gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
  //   playStoreUrl: StringConst.FOODY_BITE_PLAYSTORE_URL,
  // );
  static ProjectItemData NIMBUS = ProjectItemData(
    title: StringConst.NIMBUS,
    subtitle: StringConst.NIMBUS,
    primaryColor: AppColors.nimbus,
    platform: StringConst.NIMBUS_PLATFORM,
    category: StringConst.NIMBUS_CATEGORY,
    designer: StringConst.NIMBUS_DESIGNER,
    image: ImagePath.NIMBUS_COVER,
    coverUrl: ImagePath.NIMBUS_COVER,
    navTitleColor: AppColors.nimbusNavTitle,
    navSelectedTitleColor: AppColors.nimbusSelectedNavTitle,
    projectAssets: [
      ImagePath.NIMBUS,
    ],
    portfolioDescription: StringConst.NIMBUS_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.NIMBUS_GITHUB_URL,
    webUrl: StringConst.NIMBUS_WEB_URL,
  );
  static ProjectItemData OTP_TEXT_FIELD = ProjectItemData(
    title: StringConst.OTP_TEXT_FIELD,
    subtitle: StringConst.OTP_TEXT_FIELD_SUBTITLE,
    category: StringConst.OTP_TEXT_FIELD_CATEGORY,
    primaryColor: AppColors.otp_package,
    platform: StringConst.OTP_TEXT_FIELD_PLATFORM,
    image: ImagePath.OTP_TEXTFIELD_COVER,
    coverUrl: ImagePath.OTP_TEXTFIELD_COVER,
    portfolioDescription: StringConst.OTP_TEXT_FIELD_DETAIL,
    navTitleColor: AppColors.otpPackageNavTitle,
    navSelectedTitleColor: AppColors.otpPackageSelectedNavTitle,
    appLogoColor: AppColors.otpPackageAppLogo,
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.OTP_TEXT_FIELD_GITHUB_URL,
    webUrl: StringConst.OTP_TEXT_FIELD_WEB_URL,
  );
  static ProjectItemData AERIUM = ProjectItemData(
    title: StringConst.AERIUM,
    subtitle: StringConst.AERIUM_SUBTITLE,
    primaryColor: AppColors.aerium_v1,
    platform: StringConst.AERIUM_PLATFORM,
    category: StringConst.AERIUM_CATEGORY,
    designer: StringConst.AERIUM_DESIGNER,
    image: ImagePath.AERIUM_COVER,
    coverUrl: ImagePath.AERIUM_COVER,
    navTitleColor: AppColors.aeriumV1NavTitle,
    projectAssets: [
      ImagePath.AERIUM_COVER,
      ImagePath.AERIUM_DESIGN_2,
      ImagePath.AERIUM_DESIGN_3,
    ],
    portfolioDescription: StringConst.AERIUM_DETAIL,
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.AERIUM_GITHUB_URL,
    webUrl: StringConst.AERIUM_WEB_URL,
  );
  static ProjectItemData AERIUM_V2 = ProjectItemData(
    title: StringConst.AERIUM_V2,
    subtitle: StringConst.AERIUM_V2_SUBTITLE,
    category: StringConst.AERIUM_V2_CATEGORY,
    designer: StringConst.AERIUM_V2_DESIGNER,
    primaryColor: AppColors.aerium_v1,
    platform: StringConst.AERIUM_V2_PLATFORM,
    image: ImagePath.AERIUM_V2_LAST,
    coverUrl: ImagePath.AERIUM_V2_LAST,
    portfolioDescription: StringConst.AERIUM_V2_DETAIL,
    projectAssets: [
      ImagePath.AERIUM_V2_OVERALL,
      ImagePath.AERIUM_V2_FIRST,
      ImagePath.AERIUM_V2_TYPOGRAPHY,
      ImagePath.AERIUM_V2_LAST,
    ],
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.AERIUM_V2_GITHUB_URL,
    webUrl: StringConst.AERIUM_V2_WEB_URL,
  );
  static ProjectItemData OUTFITR = ProjectItemData(
    title: StringConst.OUTFITR,
    subtitle: StringConst.OUTFITR_SUBTITLE,
    category: StringConst.OUTFITR_CATEGORY,
    primaryColor: AppColors.outfitr,
    platform: StringConst.OUTFITR_PLATFORM,
    image: ImagePath.OUTFITR_COVER,
    coverUrl: ImagePath.OUTFITR_1,
    portfolioDescription: StringConst.OUTFITR_DETAIL,
    navTitleColor: AppColors.outfitrNavTitle,
    navSelectedTitleColor: AppColors.outfitrSelectedNavTitle,
    appLogoColor: AppColors.outfitrAppLogo,
    projectAssets: [
      ImagePath.OUTFITR_2,
      ImagePath.OUTFITR_4,
      ImagePath.OUTFITR_5,
      ImagePath.OUTFITR_6,
    ],
    isPublic: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.OUTFITR_GITHUB_URL,
    webUrl: StringConst.OUTFITR_WEB_URL,
  );
}

class Data_2 {
  static List<PillItem> pillItems = [
    PillItem(title: StringConst.FOOTWEAR, color: AppColors.accentPurpleColor),
    PillItem(title: StringConst.SPORTS, color: AppColors.accentYellowColor),
    PillItem(title: StringConst.BEAUTY, color: AppColors.accentDarkGreenColor),
    PillItem(title: StringConst.FASHION, color: AppColors.accentOrangeColor),
    PillItem(title: StringConst.ART, color: AppColors.accentPinkColor),
    PillItem(title: StringConst.JEWELRY, color: AppColors.accentPurpleColor),
    PillItem(title: StringConst.PRADA, color: AppColors.accentYellowColor),
    PillItem(title: StringConst.SUPREME, color: AppColors.accentDarkGreenColor),
    PillItem(title: StringConst.NIKE, color: AppColors.accentOrangeColor),
    PillItem(title: StringConst.VANS, color: AppColors.accentPinkColor),
    PillItem(title: StringConst.GUCCI, color: AppColors.accentPurpleColor),
    PillItem(title: StringConst.YEEZY, color: AppColors.accentYellowColor),
    PillItem(title: StringConst.ADIDAS, color: AppColors.accentDarkGreenColor),
    PillItem(title: StringConst.BALENCIAGA, color: AppColors.accentOrangeColor),
    PillItem(title: StringConst.HOT_DROP, color: AppColors.accentPinkColor),
    PillItem(title: StringConst.TOYS, color: AppColors.accentPurpleColor),
    PillItem(title: StringConst.OFF_WHITE, color: AppColors.accentYellowColor),
  ];

  static List<DropMenuItem> menuItems = [
    // DropMenuItem(
    //   title: StringConst.HOME,
    //   textColor: AppColors.accentPurpleColor,
    //   route: HomeScreenRoute(),
    // ),
    // DropMenuItem(
    //   title: StringConst.CATEGORIES,
    //   textColor: AppColors.accentOrangeColor,
    //   route: CategoriesScreenRoute(),
    // ),
    DropMenuItem(
      title: StringConst.NEW_IN,
      textColor: AppColors.accentPinkColor,
    ),
    DropMenuItem(
      title: StringConst.SALE,
      textColor: AppColors.accentYellowColor,
    ),
    // DropMenuItem(
    //   title: StringConst.PROFILE,
    //   textColor: AppColors.accentDarkGreenColor,
    //   route: ProfileScreenRoute(),
    // ),
  ];

  static List<String> userData = [
    StringConst.ORDERS_AND_RETURNS,
    StringConst.PERSONAL_DATA_PASSWORD,
    StringConst.FAQ,
  ];

  static List<SocialItem> socialItems = [
    SocialItem(
      iconData: FeatherIcons.phone,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SocialItem(
      iconData: FeatherIcons.mail,
      backgroundColor: AppColors.accentOrangeColor,
    ),
    SocialItem(
      iconData: FeatherIcons.instagram,
      backgroundColor: AppColors.accentDarkGreenColor,
    ),
    SocialItem(
      iconData: FeatherIcons.facebook,
      backgroundColor: AppColors.accentYellowColor,
    ),
  ];

  static List<CategoryItem> newArrivalItems = [
    CategoryItem(
      title: StringConst.RICE,
      imagePath: ImagePath.RICE_URL,
      subtitle: "56",
      subtitleColor: AppColors.accentOrangeColor,
    ),
    CategoryItem(
      title: StringConst.COOKIE,
      imagePath: ImagePath.COOKIE_URL,
      subtitle: "26",
      subtitleColor: AppColors.accentYellowColor,
    ),
    CategoryItem(
      title: StringConst.LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      subtitle: "17",
      subtitleColor: AppColors.accentDarkGreenColor,
    ),
  ];
  // static List<CategoryItem> newArrivalItems = [
  //   CategoryItem(
  //     title: StringConst.TROUSERS,
  //     imagePath: ImagePath.GUCCI_TROUSER,
  //     subtitle: "56",
  //     subtitleColor: AppColors.accentOrangeColor,
  //   ),
  //   CategoryItem(
  //     title: StringConst.SHIRTS,
  //     imagePath: ImagePath.GUCCI_JACKET,
  //     subtitle: "26",
  //     subtitleColor: AppColors.accentYellowColor,
  //   ),
  //   CategoryItem(
  //     title: StringConst.JEWELRY,
  //     imagePath: ImagePath.NECKLACE_1,
  //     subtitle: "17",
  //     subtitleColor: AppColors.accentDarkGreenColor,
  //   ),
  // ];

  static List<CategoryItem> categoryItems = [
    CategoryItem(
      title: StringConst.SNEAKERS,
      imagePath: ImagePath.AIR_VAPOR_MAX_SLIDE_4,
      subtitle: "56",
      subtitleColor: AppColors.accentPurpleColor,
    ),
    CategoryItem(
      title: StringConst.SHIRTS,
      imagePath: ImagePath.GUCCI_JACKET,
      subtitle: "26",
      subtitleColor: AppColors.accentYellowColor,
    ),
    CategoryItem(
      title: StringConst.JEWELRY,
      imagePath: ImagePath.NECKLACE_1,
      subtitle: "17",
      subtitleColor: AppColors.accentDarkGreenColor,
    ),
  ];

  static List<ProductDealItem> productDealItems = [
    ProductDealItem(
      title: StringConst.NIKE_BLUE,
      subtitle: StringConst.AIR_BLUE,
      imagePath: ImagePath.RICE_1,
      price: "\$250",
    ),
    ProductDealItem(
      title: StringConst.AIR_VAPOR_MAX,
      subtitle: StringConst.AIR_VAPOR_MAX_TAG,
      imagePath: ImagePath.LIL_TEA,
      price: "\$199",
    ),

    /// RICE
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: "99,000",
    ),
  ];

  static List<ProductDealItem> productLatestItems = [
    ProductDealItem(
      title: StringConst.NIKE_GREEN,
      subtitle: StringConst.AIR_GREEN,
      imagePath: ImagePath.NIKE_GREEN_SHOE,
      price: "\$299",
    ),
    ProductDealItem(
      title: StringConst.AIR_VAPOR_MAX,
      subtitle: StringConst.AIR_VAPOR_MAX_TAG,
      imagePath: ImagePath.LIL_TEA,
      price: "\$199",
    ),
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: "99,000",
    ),
  ];

  static List<ProductDealItem> trendingItems = [
    // rotab asali
    ProductDealItem(
      title: StringConst.ROTAB_ASALI,
      subtitle: StringConst.ABOUT_ROTAB_ASALI,
      imagePath: ImagePath.rotab_asali_1,
      price: StringConst.PRICE_ROTAB_ASALI,
    ),
    // rotab mazafati
    ProductDealItem(
      title: StringConst.ROTAB_MAZAFATI,
      subtitle: StringConst.ABOUT_ROTAB_MAZAFATI_2,
      imagePath: ImagePath.rotab_mazafati,
      price: StringConst.PRICE_ROTAB_MAZAFATI_2,
    ),
    ProductDealItem(
      title: StringConst.ROTAB_MAZAFATI,
      subtitle: StringConst.ABOUT_ROTAB_MAZAFATI_3,
      imagePath: ImagePath.rotab_mazafati,
      price: StringConst.PRICE_ROTAB_MAZAFATI_3,
    ),

    // dates kabkab
    ProductDealItem(
      title: StringConst.DATES,
      subtitle: StringConst.ABOUT_DATES_1,
      imagePath: ImagePath.dates_kabkab,
      price: StringConst.PRICE_DATES_2,
    ),
    ProductDealItem(
      title: StringConst.DATES,
      subtitle: StringConst.ABOUT_DATES_2,
      imagePath: ImagePath.dates_kabkab,
      price: StringConst.PRICE_DATES_2,
    ),

    ProductDealItem(
      title: StringConst.COOKIE,
      subtitle: StringConst.ABOUT_COOKIE_12,
      imagePath: ImagePath.COOKIE_URL,
      price: StringConst.PRICE_COOKIE_12,
    ),
    ProductDealItem(
      title: StringConst.COOKIE,
      subtitle: StringConst.ABOUT_COOKIE_36,
      imagePath: ImagePath.COOKIE_URL,
      price: StringConst.PRICE_COOKIE_36,
    ),
    ProductDealItem(
      title: StringConst.LILTEA,
      subtitle: StringConst.ABOUT_LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: StringConst.PRICE_LILTEA,
    ),
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: StringConst.PRICE_RICE,
    ),
    ProductDealItem(
      title: StringConst.LILTEA,
      subtitle: StringConst.ABOUT_LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: StringConst.PRICE_LILTEA,
    ),
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: StringConst.PRICE_RICE,
    ),
    ProductDealItem(
      title: StringConst.LILTEA,
      subtitle: StringConst.ABOUT_LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: "هزار تومان ۱۹۹",
    ),
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: "هزار تومان ۹۹",
    ),
  ];

// popular Product Items
  static List<ProductDealItem> popularProductItems = [
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: "هزار تومان ۹۹",
    ),
    ProductDealItem(
      title: StringConst.LILTEA,
      subtitle: StringConst.ABOUT_LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: "هزار تومان ۱۹۹",
    ),
    // ProductDealItem(
    //   title: StringConst.COOKIE,
    //   subtitle: StringConst.ABOUT_COOKIE,
    //   imagePath: ImagePath.COOKIE_URL,
    //   price: "هزار تومان ۴۰۰",
    // ),
  ];

  // new Product Items
  static List<ProductDealItem> newProductItems = [
    // ProductDealItem(
    //   title: StringConst.COOKIE,
    //   subtitle: StringConst.ABOUT_COOKIE,
    //   imagePath: ImagePath.COOKIE_URL,
    //   price: "هزار تومان ۴۰۰",
    // ),

    ProductDealItem(
      title: StringConst.LILTEA,
      subtitle: StringConst.ABOUT_LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: "هزار تومان ۱۹۹",
    ),
    ProductDealItem(
      title: StringConst.RICE,
      subtitle: StringConst.ABOUT_RICE,
      imagePath: ImagePath.RICE_URL,
      price: "هزار تومان ۹۹",
    ),
  ];

  static List<ProductDealItem> exploreItems = [
    ProductDealItem(
      title: StringConst.NECKLACE_1,
      subtitle: StringConst.MERMAID_NECKLACE,
      imagePath: ImagePath.NECKLACE_2,
      price: "\$70",
    ),
    ProductDealItem(
      title: StringConst.GUCCI_JEANS_SHIRT,
      subtitle: StringConst.SWAG,
      imagePath: ImagePath.JEAN_SHIRT,
      price: "\$1250",
    ),
    ProductDealItem(
      title: StringConst.NIKE_TC,
      subtitle: StringConst.NIKE_TC_TAG,
      imagePath: ImagePath.NIKE_TC_7900,
      price: "\$230",
    ),
  ];
  static List<ProductItem> sneakers = [
    ProductItem(
      title: StringConst.RICE,
      imagePath: ImagePath.AIR_MAX_90,
      price: "هزار تومان ۹۹",
      tag: StringConst.ABOUT_RICE,
      images: airMax90Images,
      sizes: shoeSizes,
    ),
    ProductItem(
      title: StringConst.AIR_VAPOR_MAX,
      imagePath: ImagePath.AIR_VAPOR_MAX,
      price: "\$200",
      tag: StringConst.AIR_VAPOR_MAX_TAG,
      images: airVaporMax2090Images,
      sizes: shoeSizes,
    ),
    ProductItem(
      title: StringConst.NIKE_TC,
      imagePath: ImagePath.NIKE_TC_7900,
      price: "\$399",
      tag: StringConst.NIKE_TC_TAG,
      images: nikeTc7900Images,
      sizes: shoeSizes,
    ),
  ];

  static List<ProductItem> shirts = [
    ProductItem(
      title: StringConst.GUCCI_SHIRT,
      imagePath: ImagePath.GUCCI_SHIRT,
      price: "\$1025",
      tag: StringConst.GUCCI_SHIRT,
      images: gucciShirtImages,
      sizes: shirtSizes,
    ),
    ProductItem(
      title: StringConst.BOMBER_JACKET,
      imagePath: ImagePath.BOMBER_JACKET_1,
      price: "\$400",
      tag: StringConst.BOMBER_JACKET_TAG,
      images: bomberJacket,
      sizes: shirtSizes,
    ),
    ProductItem(
      title: StringConst.SUEDE_DENIM,
      imagePath: ImagePath.SUEDE_DENIM_1,
      price: "\$399",
      tag: StringConst.SUEDE_DENIM_TAG,
      images: suedeDenim,
      sizes: shirtSizes,
    ),
  ];

  static List<ProductItem> jewelry = [
    ProductItem(
      title: StringConst.NECKLACE_1,
      imagePath: ImagePath.NECKLACE_1,
      price: "\$125",
      tag: StringConst.NECKLACE_1_TAG,
      images: silverNecklace,
      sizes: necklaceSizes,
    ),
    ProductItem(
      title: StringConst.LILTEA,
      imagePath: ImagePath.LILTEA_URL,
      price: "هزار تومان ۱۹۹",
      tag: StringConst.ABOUT_LILTEA,
      images: loveNecklace,
      sizes: necklaceSizes,
    ),
    ProductItem(
      title: StringConst.NECKLACE_3,
      imagePath: ImagePath.NECKLACE_5,
      price: "\$125",
      tag: StringConst.NECKLACE_3_TAG,
      images: bananaNecklace,
      sizes: necklaceSizes,
    ),
  ];

  static Map<String, List<ProductItem>> productCategories = {
    StringConst.SNEAKERS: sneakers,
    StringConst.SHIRTS: shirts,
    StringConst.JEWELRY: jewelry,
  };

  static List<SelectorModel> necklaceSizes = [
    SelectorModel(
      title: "6",
      isSelected: false,
      backgroundColor: AppColors.accentOrangeColor,
    ),
    SelectorModel(
      title: "8",
      isSelected: false,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SelectorModel(
      title: "9",
      isSelected: false,
      backgroundColor: AppColors.accentYellowColor,
    ),
    SelectorModel(
      title: "10",
      isSelected: false,
      backgroundColor: AppColors.accentPinkColor,
    ),
  ];
  static List<SelectorModel> shirtSizes = [
    SelectorModel(
      title: "M",
      isSelected: false,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SelectorModel(
      title: "L",
      isSelected: false,
      backgroundColor: AppColors.accentPinkColor,
    ),
    SelectorModel(
      title: "X",
      isSelected: false,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SelectorModel(
      title: "XL",
      isSelected: false,
      backgroundColor: AppColors.accentYellowColor,
    ),
    SelectorModel(
      title: "XX",
      isSelected: false,
      backgroundColor: AppColors.accentDarkGreenColor,
    ),
  ];

  static List<SelectorModel> shoeSizes = [
    SelectorModel(
      title: "38",
      isSelected: false,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SelectorModel(
      title: "39",
      isSelected: false,
      backgroundColor: AppColors.accentYellowColor,
    ),
    SelectorModel(
      title: "40",
      isSelected: false,
      backgroundColor: AppColors.accentDarkGreenColor,
    ),
    SelectorModel(
      title: "41",
      isSelected: false,
      backgroundColor: AppColors.accentOrangeColor,
    ),
    SelectorModel(
      title: "42",
      isSelected: false,
      backgroundColor: AppColors.accentPinkColor,
    ),
    SelectorModel(
      title: "43",
      isSelected: false,
      backgroundColor: AppColors.accentPurpleColor,
    ),
    SelectorModel(
      title: "44",
      isSelected: false,
      backgroundColor: AppColors.accentYellowColor,
    ),
    SelectorModel(
      title: "45",
      isSelected: false,
      backgroundColor: AppColors.accentOrangeColor,
    ),
  ];

  static List<String> airMax90Images = [
    ImagePath.AIR_MAX_90,
    ImagePath.AIR_MAX_90_SLIDE_1,
    ImagePath.RICE_URL,
    ImagePath.AIR_MAX_90_SLIDE_3,
  ];
  static List<String> airVaporMax2090Images = [
    ImagePath.AIR_VAPOR_MAX,
    ImagePath.AIR_VAPOR_MAX_SLIDE_1,
    ImagePath.AIR_VAPOR_MAX_SLIDE_2,
    ImagePath.AIR_VAPOR_MAX_SLIDE_3,
    ImagePath.AIR_VAPOR_MAX_SLIDE_4,
  ];
  static List<String> nikeTc7900Images = [
    ImagePath.NIKE_TC_7900,
    ImagePath.NIKE_TC_7900_SLIDE_1,
    ImagePath.NIKE_TC_7900_SLIDE_2,
    ImagePath.NIKE_TC_7900_SLIDE_3,
  ];

  static List<String> gucciShirtImages = [
    ImagePath.GUCCI_SHIRT,
    ImagePath.GUCCI_JACKET,
    ImagePath.GUCCI_TROUSER,
  ];
  static List<String> suedeDenim = [
    ImagePath.SUEDE_DENIM_1,
    ImagePath.SUEDE_DENIM_2,
    ImagePath.COOKIE_URL,
  ];

  static List<String> bomberJacket = [
    ImagePath.BOMBER_JACKET_1,
    ImagePath.BOMBER_JACKET_2,
    ImagePath.BOMBER_JACKET_3,
  ];

  static List<String> silverNecklace = [
    ImagePath.NECKLACE_1,
    ImagePath.NECKLACE_2,
  ];

  static List<String> loveNecklace = [
    ImagePath.NECKLACE_3,
    ImagePath.LILTEA_URL,
  ];

  static List<String> bananaNecklace = [
    ImagePath.NECKLACE_5,
  ];

  static List<Color> colors = [
    AppColors.accentPurpleColor,
    AppColors.accentPinkColor,
    AppColors.accentYellowColor,
    AppColors.accentDarkGreenColor,
    AppColors.accentOrangeColor,
    AppColors.primaryColor,
    AppColors.secondaryColor2,
    AppColors.secondaryColor,
  ];

  static List<BrandItem> brands = [
    BrandItem(
      brand: StringConst.NIKE,
      imagePath: ImagePath.NIKE_SWOOSH,
      color: AppColors.accentPurpleColor,
    ),
    BrandItem(
      brand: StringConst.ADIDAS,
      imagePath: ImagePath.ADIDAS,
      color: AppColors.accentPinkColor,
    ),
    BrandItem(
      brand: StringConst.JORDAN,
      imagePath: ImagePath.JORDAN,
      color: AppColors.accentYellowColor,
    ),
    BrandItem(
      brand: StringConst.NEW_BALANCE,
      imagePath: ImagePath.NEW_BALANCE,
      color: AppColors.accentDarkGreenColor,
    ),
    BrandItem(
      brand: StringConst.PUMA,
      imagePath: ImagePath.PUMA,
      color: AppColors.accentOrangeColor,
    ),
    BrandItem(
      brand: StringConst.REEBOK,
      imagePath: ImagePath.REEBOK,
      color: AppColors.accentPurpleColor,
    ),
    BrandItem(
      brand: StringConst.TIMBERLAND,
      imagePath: ImagePath.TIMBERLAND,
      color: AppColors.accentDarkGreenColor,
    ),
    BrandItem(
      brand: StringConst.KSWISS,
      imagePath: ImagePath.KSWISS,
      color: AppColors.accentOrangeColor,
    ),
  ];

  static List<CheckOutItem> checkOutItems = [
    CheckOutItem(
      title: StringConst.AIR_VAPOR_MAX,
      imagePath: ImagePath.AIR_VAPOR_MAX,
      price: "200",
      quantity: "1",
    ),
    CheckOutItem(
      title: StringConst.GUCCI_SHIRT,
      imagePath: ImagePath.GUCCI_SHIRT,
      price: "1025",
      quantity: "1",
    ),
    CheckOutItem(
      title: StringConst.NECKLACE_3,
      imagePath: ImagePath.NECKLACE_5,
      price: "125",
      quantity: "2",
    ),
  ];
}
