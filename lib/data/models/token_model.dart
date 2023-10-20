class TokenModel {
  final String refresh;
  final String access;

  const TokenModel({
    required this.refresh,
    required this.access,
  });

  

  TokenModel copyWith({
    String? refresh,
    String? access,
  }) {
    return TokenModel(
      refresh: refresh ?? this.refresh,
      access: access ?? this.access,
    );
  }

  @override
  String toString() => 'TokenModel(refresh: $refresh, token: $access)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.refresh == refresh &&
      other.access == access;
  }

  @override
  int get hashCode => refresh.hashCode ^ access.hashCode;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'refresh': refresh,
      'access': access,
    };
  }

  factory TokenModel.fromMap(Map<String, Object?> map) {
    return TokenModel(
      refresh: map['refresh'] as String,
      access: map['access'] as String,
    );
  }

}
