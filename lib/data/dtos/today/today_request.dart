class AddBodyDataRequestDTO{
  final double fat;
  final double muscle;
  final double weight;


  AddBodyDataRequestDTO(this.fat, this.muscle, this.weight);

  Map<String, dynamic> toJson() =>
      {"fat": fat, "muscle": muscle, "weight": weight};
}