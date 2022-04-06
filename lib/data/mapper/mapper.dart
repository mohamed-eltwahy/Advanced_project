import '../../domain/model/models.dart';
import '../response/responses.dart';
import 'package:advanced_tips/app/extentions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id.orEmpty() ?? "", this?.name ?? "",
        this?.numOfNotifications.orZero() ?? 0);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.phone.orEmpty() ?? "", this?.email.orEmpty() ?? "",
        this?.link.orEmpty() ?? "");
  }
}

extension AuthonticationResponseMapper on AuthonticationResponse? {
  Authontication toDomain() {
    return Authontication(this?.customer.toDomain() , this?.contacts.toDomain());
  }
}
