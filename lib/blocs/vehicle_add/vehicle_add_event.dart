// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_add_bloc.dart';

abstract class VehicleAddEvent {}

class VehicleUpdateImages extends VehicleAddEvent {
  List<String> imageUrls;
  VehicleUpdateImages({required this.imageUrls});
}

class VehicleUpdateImageFetched extends VehicleAddEvent {}

class LocationPickerVehilceAddEvent extends VehicleAddEvent {}

class ImageAddingButtonClicked extends VehicleAddEvent {}

class ImageRemoveButtonClicked extends VehicleAddEvent {
  String vehicleId;
  String imageId;
  int index;
  ImageRemoveButtonClicked({required this.index,required this.imageId,required this.vehicleId});
}

class FirstPageFinishVehilceAddEvent extends VehicleAddEvent {}

class VehicleUpdateEvent extends VehicleAddEvent {}
