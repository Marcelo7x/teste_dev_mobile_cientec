enum DestinatarioEnum {
  cras('CRAS'),
  creas('CREAS'),
  defensoriaPublica('Defensoria Pública'),
  ministerioPublico('Ministério Público'),
  poderJudiciario('Poder Judiciário'),;

  final String destinatario;
  const DestinatarioEnum(this.destinatario);
}
