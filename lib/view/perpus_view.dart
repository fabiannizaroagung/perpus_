import 'package:flutter/material.dart';
import 'package:perpus/controller/perpus_controller.dart';
import 'package:perpus/models/perpus.dart';
import 'package:perpus/widget/bottmon_nav.dart';

class PerpusView extends StatefulWidget {
  const PerpusView({super.key});

  @override
  State<PerpusView> createState() => _PerpusViewState();
}

class _PerpusViewState extends State<PerpusView> {
  PerpusController perpus = PerpusController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController ratingInput = TextEditingController();
  TextEditingController coverInput = TextEditingController();
  TextEditingController penerbitInput = TextEditingController();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Perpus>? buku;
  int? buku_id;

  getBuku() {
    setState(() {
      buku = perpus.buku;
    });
  }

  addBuku(data) {
    buku!.add(data);
    getBuku();
  }

  @override
  void initState() {
    super.initState();
    getBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 22, 118, 160),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                buku_id = null;
              });
              titleInput.text = "";
              coverInput.text = "";
              ratingInput.text = "";
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: buku != null
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 4 / 5,
                ),
                itemCount: buku!.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Stok Buku : 2',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 60, 102, 123),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            image: AssetImage(
                              buku![index].cover,
                            ),
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                buku![index].id.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 208, 41, 149),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(),
                              Text(
                                buku![index].judul,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    buku![index].rating.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                buku![index].penerbit,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 22, 118, 160),
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                buku![index].pengarang,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                buku![index].deskripsi,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 63, 61, 61),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                            size: 24.0,
                          ),
                          itemBuilder: (BuildContext context) {
                            return listAct.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                                onTap: () {
                                  if (choice == "Ubah") {
                                    setState(() {
                                      buku_id = buku![index].id;
                                    });

                                    titleInput.text = buku![index].judul;
                                    coverInput.text = buku![index].cover;
                                    ratingInput.text =
                                        buku![index].rating.toString();
                                    penerbitInput.text = buku![index].penerbit;
                                  } else if (choice == "Hapus") {
                                    buku!.removeWhere(
                                        (item) => item.id == buku![index].id);
                                    getBuku();
                                  }
                                },
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(child: Text("Data Kosong")),
      bottomNavigationBar: BottomNav(2),
    );
  }
}
