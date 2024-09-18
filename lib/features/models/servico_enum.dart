enum ServicoEnum {
  encaminhamento('Encaminhamento'),
  acompanhamento('Acompanhamento'),
  abordagemSocial('Abordagem Social'),
  acolhimento('Acolhimento'),
  scfv('SCFV');

  final String value;
  const ServicoEnum(this.value);
  factory ServicoEnum.fromValue(String value) {
    switch (value) {
      case 'Encaminhamento':
        return ServicoEnum.encaminhamento;
      case 'Acompanhamento':
        return ServicoEnum.acompanhamento;
      case 'Abordagem Social':
        return ServicoEnum.abordagemSocial;
      case 'Acolhimento':
        return ServicoEnum.acolhimento;
      case 'SCFV':
        return ServicoEnum.scfv;
      default:
        throw Exception('Serviço não encontrado');
    }
  }
}
