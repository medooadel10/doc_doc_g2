import 'package:docdoc_app/features/home/models/specializations_response_model.dart';

class DoctorsResponseModel {
  final String message;
  final bool status;
  final List<DoctorModel> doctors;

  DoctorsResponseModel({
    required this.message,
    required this.status,
    required this.doctors,
  });
  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorsResponseModel(
        message: json['message'],
        status: json['status'],
        doctors: (json['data'] as List<dynamic>)
            .map((e) => DoctorModel.fromJson(e))
            .toList(),
      );
}

class DoctorModel {
  final int id;
  final String name;
  final Specialization specialization;
  final String email;
  final String phone;
  final String photo;
  final String degree;
  final String description;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.email,
    required this.phone,
    required this.photo,
    required this.degree,
    required this.description,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json['id'],
    name: json['name'],
    specialization: Specialization.fromJson(json['specialization']),
    email: json['email'],
    phone: json['phone'],
    photo: json['photo'],
    degree: json['degree'],
    description: json['description'],
  );
}
