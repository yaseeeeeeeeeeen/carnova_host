part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent {}

class LoginClickedEvent extends LoginBlocEvent {

Map<String, String> mailandpass;
  LoginClickedEvent({required this.mailandpass});
  
}

class HostDetailsFetch extends LoginBlocEvent{}

class HostDashboardFetchEvent extends LoginBlocEvent{}