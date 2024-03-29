// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_verfication_bloc.dart';

abstract class HostOtpVerficationState {}

final class HostOtpVerficationInitial extends HostOtpVerficationState {}

class HostOtpVerificationLoadingState extends HostOtpVerficationState {}

class HostOtpVerificationTokenGetState extends HostOtpVerficationState {
  String token;
  HostOtpVerificationTokenGetState({
    required this.token
  });
  
}

class HostOtpVerificationSuccsessState extends HostOtpVerficationState {}

class HostOtpVerificationFailedState extends HostOtpVerficationState {
  String message;
  HostOtpVerificationFailedState({
    required this.message,
  });
}
