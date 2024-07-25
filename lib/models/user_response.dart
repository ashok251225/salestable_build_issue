// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final UserData data;
  final int statusCode;
  final String message;

  UserResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: json["data"] != null
          ? UserData.fromJson(json["data"])
          : UserData(user: User(), organisations: []),
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class UserData {
  final String? access;
  final String? refresh;
  final bool? canCreateOrganisation;
  final User user;
  final bool? canProceed;
  final List<Organisation> organisations;

  UserData({
    this.access,
    this.refresh,
    this.canCreateOrganisation,
    required this.user,
    this.canProceed,
    required this.organisations,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      access: json["access"] ?? '',
      refresh: json["refresh"] ?? '',
      canCreateOrganisation: json["can_create_organisation"] ?? false,
      user: json["user"] != null ? User.fromJson(json["user"]) : User(),
      canProceed: json["can_proceed"] ?? false,
      organisations: (json["organisations"] as List<dynamic>?)
              ?.map((x) => Organisation.fromJson(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
        "can_create_organisation": canCreateOrganisation,
        "user": user.toJson(),
        "can_proceed": canProceed,
        "organisations":
            List<dynamic>.from(organisations!.map((x) => x.toJson())),
      };
}

class Organisation {
  final String slug;
  final String? name;
  final String? logo;
  final String? domain;
  final int? status;
  final String? website;
  final Category? size;
  final Category? category;
  final dynamic sector;
  final int? checkInFrequency;
  final int? repeatDay;
  final int userRole;
  final bool? selected;
  final String? rejectionReason;
  final int? membersCount;
  final String? timezone;
  final DateTime? userJoinedAt;
  final DateTime? createdAt;
  final bool? salesRepRequireOnboardTraining;
  final bool? salesLeadRequireOnboarding;
  final dynamic supportEmail;
  final int? maxFileUploadSize;
  final bool? recruitingModuleEnabled;
  final String? stripeSubscriptionId;
  final String? stripeCustomerId;
  final String? subscriptionDate;
  final Category? subscriptionStatus;
  final int? billedUsers;
  final int? activeUsers;
  final int? allowedAccess;
  final String? brandedLogo;
  final int? remainingDays;
  final bool? flexibleCheckinWindows;
  final int? product;
  final Subscription? subscription;
  final bool? isFreeTrialActive;
  final bool? isCancelSubSent;
  final bool? deletedForRetention;

  Organisation({
    required this.slug,
    this.name,
    this.logo,
    this.domain,
    this.status,
    this.website,
    this.size,
    this.category,
    this.sector,
    this.checkInFrequency,
    this.repeatDay,
    required this.userRole,
    this.selected,
    this.rejectionReason,
    this.membersCount,
    this.timezone,
    this.userJoinedAt,
    this.createdAt,
    this.salesRepRequireOnboardTraining,
    this.salesLeadRequireOnboarding,
    this.supportEmail,
    this.maxFileUploadSize,
    this.recruitingModuleEnabled,
    this.stripeSubscriptionId,
    this.stripeCustomerId,
    this.subscriptionDate,
    this.subscriptionStatus,
    this.billedUsers,
    this.activeUsers,
    this.allowedAccess,
    this.brandedLogo,
    this.remainingDays,
    this.flexibleCheckinWindows,
    this.product,
    this.subscription,
    this.isFreeTrialActive,
    this.isCancelSubSent,
    this.deletedForRetention,
  });

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
        slug: json["slug"] ?? '',
        name: json["name"] ?? '',
        logo: json["logo"] ?? '',
        domain: json["domain"] ?? '',
        status: json["status"] ?? 0,
        website: json["website"] ?? '',
        size: Category.fromJson(json["size"]),
        category: Category.fromJson(json["category"]),
        sector: json["sector"],
        checkInFrequency: json["check_in_frequency"] ?? 0,
        repeatDay: json["repeat_day"] ?? 0,
        userRole: json["user_role"] ?? 0,
        selected: json["selected"] ?? false,
        rejectionReason: json["rejection_reason"] ?? '',
        membersCount: json["members_count"] ?? 0,
        timezone: json["timezone"] ?? '',
        userJoinedAt: DateTime.parse(json["user_joined_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        salesRepRequireOnboardTraining:
            json["sales_rep_require_onboard_training"] ?? false,
        salesLeadRequireOnboarding:
            json["sales_lead_require_onboarding"] ?? false,
        supportEmail: json["support_email"],
        maxFileUploadSize: json["max_file_upload_size"],
        recruitingModuleEnabled: json["recruiting_module_enabled"],
        stripeSubscriptionId: json["stripe_subscription_id"] ?? '',
        stripeCustomerId: json["stripe_customer_id"] ?? '',
        subscriptionDate: json["subscription_date"] ?? '',
        subscriptionStatus: Category.fromJson(json["subscription_status"]),
        billedUsers: json["billed_users"] ?? 0,
        activeUsers: json["active_users"] ?? 0,
        allowedAccess: json["allowed_access"] ?? 0,
        brandedLogo: json["brandedLogo"] ?? '',
        remainingDays: json["remaining_days"] ?? 0,
        flexibleCheckinWindows: json["flexible_checkin_windows"] ?? false,
        product: json["product"] ?? 0,
        subscription: Subscription.fromJson(json["subscription"]),
        isFreeTrialActive: json["is_free_trial_active"] ?? false,
        isCancelSubSent: json["is_cancel_sub_sent"] ?? false,
        deletedForRetention: json["deleted_for_retention"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "logo": logo,
        "domain": domain,
        "status": status,
        "website": website,
        "size": size!.toJson(),
        "category": category!.toJson(),
        "sector": sector,
        "check_in_frequency": checkInFrequency,
        "repeat_day": repeatDay,
        "user_role": userRole,
        "selected": selected,
        "rejection_reason": rejectionReason,
        "members_count": membersCount,
        "timezone": timezone,
        "user_joined_at": userJoinedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "sales_rep_require_onboard_training": salesRepRequireOnboardTraining,
        "sales_lead_require_onboarding": salesLeadRequireOnboarding,
        "support_email": supportEmail,
        "max_file_upload_size": maxFileUploadSize,
        "recruiting_module_enabled": recruitingModuleEnabled,
        "stripe_subscription_id": stripeSubscriptionId,
        "stripe_customer_id": stripeCustomerId,
        "subscription_date": subscriptionDate,
        "subscription_status": subscriptionStatus!.toJson(),
        "billed_users": billedUsers,
        "active_users": activeUsers,
        "allowed_access": allowedAccess,
        "brandedLogo": brandedLogo,
        "remaining_days": remainingDays,
        "flexible_checkin_windows": flexibleCheckinWindows,
        "product": product,
        "subscription": subscription!.toJson(),
        "is_free_trial_active": isFreeTrialActive,
        "is_cancel_sub_sent": isCancelSubSent,
        "deleted_for_retention": deletedForRetention,
      };
}

class Category {
  final int value;
  final String label;

  Category({
    required this.value,
    required this.label,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        value: json["value"] ?? 0,
        label: json["label"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
      };
}

class Subscription {
  final String stripeSubscriptionId;
  final String stripeCustomerId;
  final String subscriptionDate;
  final Category subscriptionStatus;
  final int product;
  final int maxFileUploadSize;
  final int billedUsers;
  final int activeUsers;
  final int totalAssessments;
  final int totalModules;
  final Price? price;
  final String? interval;

  Subscription({
    required this.stripeSubscriptionId,
    required this.stripeCustomerId,
    required this.subscriptionDate,
    required this.subscriptionStatus,
    required this.product,
    required this.maxFileUploadSize,
    required this.billedUsers,
    required this.activeUsers,
    required this.totalAssessments,
    required this.totalModules,
    this.price,
    this.interval,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        stripeSubscriptionId: json["stripe_subscription_id"] ?? '',
        stripeCustomerId: json["stripe_customer_id"] ?? '',
        subscriptionDate: json["subscription_date"] ?? '',
        subscriptionStatus: Category.fromJson(json["subscription_status"]),
        product: json["product"] ?? 0,
        maxFileUploadSize: json["max_file_upload_size"] ?? 0,
        billedUsers: json["billed_users"] ?? 0,
        activeUsers: json["active_users"] ?? 0,
        totalAssessments: json["total_assessments"] ?? 0,
        totalModules: json["total_modules"] ?? 0,
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        interval: json["interval"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "stripe_subscription_id": stripeSubscriptionId,
        "stripe_customer_id": stripeCustomerId,
        "subscription_date": subscriptionDate,
        "subscription_status": subscriptionStatus.toJson(),
        "product": product,
        "max_file_upload_size": maxFileUploadSize,
        "billed_users": billedUsers,
        "active_users": activeUsers,
        "total_assessments": totalAssessments,
        "total_modules": totalModules,
        "price": price?.toJson(),
        "interval": interval,
      };
}

class Price {
  final String name;
  final String stripeId;
  final String description;
  final int price;
  final String billingCycle;
  final String currency;
  final dynamic monthlyPrice;
  final String stripeNickname;

  Price({
    required this.name,
    required this.stripeId,
    required this.description,
    required this.price,
    required this.billingCycle,
    required this.currency,
    required this.monthlyPrice,
    required this.stripeNickname,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        name: json["name"] ?? '',
        stripeId: json["stripe_id"] ?? '',
        description: json["description"] ?? '',
        price: json["price"] ?? 0,
        billingCycle: json["billing_cycle"] ?? '',
        currency: json["currency"] ?? '',
        monthlyPrice: json["monthly_price"] ?? 0,
        stripeNickname: json["stripe_nickname"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stripe_id": stripeId,
        "description": description,
        "price": price,
        "billing_cycle": billingCycle,
        "currency": currency,
        "monthly_price": monthlyPrice,
        "stripe_nickname": stripeNickname,
      };
}

class User {
  final int? id;
  final String? uuid;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profilePic;
  final bool? emailVerified;
  final String? timezone;
  final bool? isSocialLogin;
  final dynamic designation;

  User({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.emailVerified,
    this.timezone,
    this.isSocialLogin,
    this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        uuid: json["uuid"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        email: json["email"] ?? '',
        profilePic: json["profile_pic"] ?? '',
        emailVerified: json["email_verified"] ?? false,
        timezone: json["timezone"] ?? '',
        isSocialLogin: json["is_social_login"] ?? false,
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
        "email_verified": emailVerified,
        "timezone": timezone,
        "is_social_login": isSocialLogin,
        "designation": designation,
      };
}
