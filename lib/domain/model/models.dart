class Customer {
  String id;
  String name;
  int numOfNotifications;
  Customer(
    this.id,
    this.name,
    this.numOfNotifications,
  );
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(
    this.phone,
    this.email,
    this.link,
  );
}

class Authontication {
  Customer? customer;
  Contacts? contacts;
  Authontication(
    this.customer,
    this.contacts,
  );
}
