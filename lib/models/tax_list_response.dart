import 'package:handyman_provider_flutter/models/pagination_model.dart';

class TaxListResponse {
  List<TaxData>? taxData;
  Pagination? pagination;

  TaxListResponse({this.taxData, this.pagination});

  factory TaxListResponse.fromJson(Map<String, dynamic> json) {
    return TaxListResponse(
      taxData: json['data'] != null ? (json['data'] as List).map((i) => TaxData.fromJson(i)).toList() : null,
      pagination: json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.taxData != null) {
      data['data'] = this.taxData!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class TaxData {
  int? id;
  int? provider_id;
  String? title;
  String? type;
  int? value;

  TaxData({this.id, this.provider_id, this.title, this.type, this.value});

  factory TaxData.fromJson(Map<String, dynamic> json) {
    return TaxData(
      id: json['id'],
      provider_id: json['provider_id'],
      title: json['title'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_id'] = this.provider_id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
