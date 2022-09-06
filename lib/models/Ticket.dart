class Ticket {
  final String name;
  final String email;

  Ticket(this.name, this.email);

  Ticket.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}