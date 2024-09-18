enum ServiceEnum {
  encaminhamento('Encaminhamento'),
  acompanhamento('Acompanhamento'),
  abordagemSocial('Abordagem Social'),
  acolhimento('Acolhimento'),
  scfv('SCFV');

  final String value;
  const ServiceEnum(this.value);
  factory ServiceEnum.fromValue(String value) {
    switch (value) {
      case 'Encaminhamento':
        return ServiceEnum.encaminhamento;
      case 'Acompanhamento':
        return ServiceEnum.acompanhamento;
      case 'Abordagem Social':
        return ServiceEnum.abordagemSocial;
      case 'Acolhimento':
        return ServiceEnum.acolhimento;
      case 'SCFV':
        return ServiceEnum.scfv;
      default:
        throw Exception('Serviço não encontrado');
    }
  }
}
