class CommomFunctions {
  static getRidesStatus(int rideStatusNum) {
    switch (rideStatusNum) {
      case 0:
        return 'WAITING FOR RIDE REQUEST';

      case 1:
        return 'WAITING FOR DRIVER TO ARRIVE';

      case 2:
        return 'MOVING TOWARDS DESTINATION';

      case 3:
        return 'RIDE COMPLETED';
    }
  }
}
