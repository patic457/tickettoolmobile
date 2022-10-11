class TicketModel {
  final String name;
  final String email;

  TicketModel(this.name, this.email);

  TicketModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
