class FicheGDAModel {
  final int idGouv;
  final String libFr; // nom gouv
  final int idDelegation;
  final int code; //gda_id

  FicheGDAModel(
    this.idGouv,
    this.libFr,
    this.idDelegation,
    this.code,
  );
  factory FicheGDAModel.fromJson(Map<String, dynamic> json) {
    return FicheGDAModel(
      json['id_gouv'] as int,
      json['lib_fr'] as String,
      json['id_delegation'] as int,
      json['code'] as int,
    );
  }
}
