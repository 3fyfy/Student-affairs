class Fee {
  int fees;
  FeesId feesId;
  int paymentType;
  int yearOfFees;

  Fee({this.fees, this.feesId, this.paymentType, this.yearOfFees});

  Fee.fromJson(Map<String, dynamic> json) {
    fees = json['fees'];
    feesId =
    json['feesId'] != null ? new FeesId.fromJson(json['feesId']) : null;
    paymentType = json['payment_type'];
    yearOfFees = json['yearOfFees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fees'] = this.fees;
    if (this.feesId != null) {
      data['feesId'] = this.feesId.toJson();
    }
    data['payment_type'] = this.paymentType;
    data['yearOfFees'] = this.yearOfFees;
    return data;
  }
}

class FeesId {
  String datePayment;
  int feesType;
  int ssn;

  FeesId({this.datePayment, this.feesType, this.ssn});

  FeesId.fromJson(Map<String, dynamic> json) {
    datePayment = json['date_payment'];
    feesType = json['fees_type'];
    ssn = json['ssn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_payment'] = this.datePayment;
    data['fees_type'] = this.feesType;
    data['ssn'] = this.ssn;
    return data;
  }
}