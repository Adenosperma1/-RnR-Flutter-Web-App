


Future<bool> delay(int milliseconds) {
    return Future.delayed(Duration(milliseconds: milliseconds))
                 .then((onValue) => true);
}