Future<String> getNama() async {
  await Future.delayed(Duration(seconds: 2)); 
  return 'Mina';
}

void main() async{
  print('Loading data...');
  String nama = await getNama();
  print('halo $nama');
}