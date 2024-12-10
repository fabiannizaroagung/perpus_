import 'package:perpus/models/perpus.dart';

class PerpusController {
  final List<Perpus> buku = [
    Perpus(
        id: 1,
        judul: 'Journey to the west ',
        rating: 4.5,
        cover: 'assets/coverJurney.png',
        penerbit: 'World Publishing Corporation',
        pengarang: 'Wu Cheng en',
        deskripsi:
            'salah satu karya klasik sastra Tiongkok yang ditulis pada abad ke-16 oleh Wu Cheng en. Novel ini termasuk dalam "Empat Karya Sastra Klasik Besar Tiongkok, bersama dengan Romance of the Three Kingdoms," "Water Margin," dan "Dream of the Red Chamber.'),
    Perpus(
        id: 2,
        judul: 'How to build Ak47',
        rating: 3.1,
        cover: 'assets/coverAk47.png',
        penerbit: 'Hachette Group Book',
        pengarang: 'Marshall Trivett ',
        deskripsi:
            'salah satu karya pengetahuan mendetail mengenai senapan AK-47, baik dari segi sejarah, desain, hingga cara kerja komponen-komponennya. Buku seperti ini sering kali menampilkan informasi mengenai latar belakang dan mekanisme AK-47.'),
  ];
}
