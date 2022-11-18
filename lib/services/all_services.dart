part of 'services.dart';

class DestinationServices {
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  CollectionReference _bookingReference =
      FirebaseFirestore.instance.collection('booking');

  CollectionReference _hotelsReference =
      FirebaseFirestore.instance.collection('hotels');

  CollectionReference _transportationReference =
      FirebaseFirestore.instance.collection('transportation');

  CollectionReference _guideTourReference =
      FirebaseFirestore.instance.collection('guideTour');

  CollectionReference _paketReference =
      FirebaseFirestore.instance.collection('paket');

  CollectionReference _infoReference =
      FirebaseFirestore.instance.collection('info');

  Future<List<DestinationModel>> getDestination() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destination = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(destination);
      return destination;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getHotels() async {
    try {
      QuerySnapshot result = await _hotelsReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getTransportation() async {
    try {
      QuerySnapshot result = await _transportationReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getPaket() async {
    try {
      QuerySnapshot result = await _paketReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<InfoModel>> getInfo() async {
    try {
      QuerySnapshot result = await _infoReference.get();

      List<InfoModel> info = result.docs.map(
        (e) {
          return InfoModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(info);
      return info;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<GuideTourModel>> getguideTour() async {
    try {
      QuerySnapshot result = await _guideTourReference.get();

      List<GuideTourModel> guideTour = result.docs.map(
        (e) {
          return GuideTourModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(guideTour);
      return guideTour;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getBooking() async {
    try {
      QuerySnapshot result = await _bookingReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getBookingLain() async {
    try {
      QuerySnapshot result = await _bookingReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }

  Future<List<DestinationModel>> getDestBooking() async {
    try {
      QuerySnapshot result = await _bookingReference.get();

      List<DestinationModel> hotels = result.docs.map(
        (e) {
          return DestinationModel.fromJson(e.data() as Map<String, dynamic>);
        },
      ).toList();
      print(hotels);
      return hotels;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }
}
