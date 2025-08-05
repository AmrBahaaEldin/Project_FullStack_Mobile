class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    cardExpire: json['cardExpire'] as String?,
    cardNumber: json['cardNumber'] as String?,
    cardType: json['cardType'] as String?,
    currency: json['currency'] as String?,
    iban: json['iban'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'cardExpire': cardExpire,
    'cardNumber': cardNumber,
    'cardType': cardType,
    'currency': currency,
    'iban': iban,
  };
}
