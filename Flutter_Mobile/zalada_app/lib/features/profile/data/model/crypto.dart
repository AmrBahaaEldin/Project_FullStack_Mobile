class Crypto {
  String? coin;
  String? wallet;
  String? network;

  Crypto({this.coin, this.wallet, this.network});

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
    coin: json['coin'] as String?,
    wallet: json['wallet'] as String?,
    network: json['network'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'coin': coin,
    'wallet': wallet,
    'network': network,
  };
}
