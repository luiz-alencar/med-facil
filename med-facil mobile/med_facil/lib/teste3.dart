class Medicamento {
  final String nome;
  final String dosagem;

  Medicamento(this.nome, this.dosagem);
}

List<Medicamento> medicamentos = [
  Medicamento('Paracetamol', '500mg'),
  Medicamento('Ibuprofeno', '200mg'),
  Medicamento('Aspirina', '325mg'),
  Medicamento('Amoxicilina', '500mg'),
  // Adicione mais medicamentos conforme necessário
];