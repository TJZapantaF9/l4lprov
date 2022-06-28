class ProviderSubscriptionModel {
  int? id;
  String? title;
  String? identifier;
  int? amount;
  String? type;
  String? endAt;
  int? planId;
  String? startAt;
  String? status;
  int? trialPeriod;
  String? description;
  String? duration;
  PlanLimitation? plan_limitation;
  String? plan_type;
  String? trial_period;

  ProviderSubscriptionModel({
    this.id,
    this.title,
    this.identifier,
    this.amount,
    this.type,
    this.endAt,
    this.planId,
    this.startAt,
    this.status,
    this.trialPeriod,
    this.description,
    this.duration,
    this.plan_limitation,
    this.plan_type,
    this.trial_period,
  });

  factory ProviderSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return ProviderSubscriptionModel(
      amount: json['amount'],
      endAt: json['end_at'],
      plan_limitation: json['plan_limitation'] != null ? PlanLimitation.fromJson(json['plan_limitation']) : null,
      id: json['id'],
      identifier: json['identifier'],
      planId: json['plan_id'],
      startAt: json['start_at'],
      status: json['status'],
      type: json['type'],
      title: json['title'],
      trialPeriod: json['trial_period'],
      description: json['description'],
      duration: json['duration'],
      plan_type: json['plan_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['end_at'] = this.endAt;
    data['id'] = this.id;
    data['identifier'] = this.identifier;
    data['plan_id'] = this.planId;
    data['start_at'] = this.startAt;
    data['status'] = this.status;
    data['type'] = this.type;
    data['title'] = this.title;
    data['trial_period'] = this.trialPeriod;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['plan_limitation'] = this.plan_limitation;
    data['plan_type'] = this.plan_type;
    if (this.plan_limitation != null) {
      data['plan_limitation'] = this.plan_limitation!.toJson();
    }
    return data;
  }
}

class PlanLimitation {
  LimitData? featured_service;
  LimitData? handyman;
  LimitData? service;

  PlanLimitation({this.featured_service, this.handyman, this.service});

  factory PlanLimitation.fromJson(Map<String, dynamic> json) {
    return PlanLimitation(
      featured_service: json['featured_service'] != null ? LimitData.fromJson(json['featured_service']) : null,
      handyman: json['handyman'] != null ? LimitData.fromJson(json['handyman']) : null,
      service: json['service'] != null ? LimitData.fromJson(json['service']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featured_service != null) {
      data['featured_service'] = this.featured_service!.toJson();
    }
    if (this.handyman != null) {
      data['handyman'] = this.handyman!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class LimitData {
  String? isChecked;
  String? limit;

  LimitData({this.isChecked, this.limit});

  factory LimitData.fromJson(Map<String, dynamic> json) {
    return LimitData(
      isChecked: json['is_checked'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_checked'] = this.isChecked;
    data['limit'] = this.limit;
    return data;
  }
}
