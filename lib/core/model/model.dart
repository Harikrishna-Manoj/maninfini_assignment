class Data {
  String? name;
  int? phone;
  DateTime? joinDate;

  Data({required this.name, required this.phone, required this.joinDate});
}

List<Data> myData = [
  Data(
      name: "Khaliq",
      phone: 09876543,
      joinDate: DateTime.parse("2027-03-04 06:06:48")),
  Data(
      name: "David",
      phone: 6464646,
      joinDate: DateTime.parse("2011-05-04 06:06:48")),
  Data(
      name: "Kamal",
      phone: 8888,
      joinDate: DateTime.parse("2021-06-08 06:06:48")),
  Data(
      name: "Ali",
      phone: 3333333,
      joinDate: DateTime.parse("2023-03-23 06:06:48")),
  Data(
      name: "Muzal",
      phone: 987654556,
      joinDate: DateTime.parse("2013-03-12 06:06:48")),
  Data(
      name: "Taimu",
      phone: 46464664,
      joinDate: DateTime.parse("2021-12-06 06:06:48")),
  Data(
      name: "Mehdi",
      phone: 5353535,
      joinDate: DateTime.parse("2019-03-04 06:06:48")),
  Data(
      name: "Rex",
      phone: 244242,
      joinDate: DateTime.parse("2015-03-04 06:06:48")),
  Data(
      name: "Alex",
      phone: 323232323,
      joinDate: DateTime.parse("2020-05-21 06:06:48")),
];
