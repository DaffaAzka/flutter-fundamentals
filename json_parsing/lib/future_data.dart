class FutureData {

  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Data loaded";
  }

  Future getEmpty() async {
    
  }


}