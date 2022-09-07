import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var menuListesi = <String>[];
  var kampanyalarListesi = <String>[];

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuListesi.add("Tüm Kampanyalar");
    menuListesi.add("Erkek");
    menuListesi.add("Kadın");
    menuListesi.add("Ayakkabı & Çanta");

    kampanyalarListesi.add("k1.jpg");
    kampanyalarListesi.add("k2.jpg");
    kampanyalarListesi.add("k3.jpg");
    kampanyalarListesi.add("k4.jpg");
  }



  @override
  Widget build(BuildContext context) {
    int secilenNav = 0;
    final List<int> colorCodes = <int>[600, 500, 100 ,200,500,150,250,450,800,600];
    final List<String> resimler = <String>["r1.jpg","r2.jpg","r3.jpg","r4.jpg"];

    return Scaffold(
      body: Center(
        //-------------------------------------Search bar---------------------------------------
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45,left: 10,right: 10,bottom: 20  ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xfff9f9f9),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black,size: 35,),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("Morhipo'da ara",style: TextStyle(color: Colors.grey,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.qr_code_scanner, color: Colors.grey,size: 25,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Icon(Icons.mic_rounded, color: Colors.grey,size: 25,),
                          ),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                style: TextStyle(backgroundColor: Colors.white24),//------------------
              ),
            ),
            //----------------------------------------------------------------------------------------
            //--------------------------------------sekmeler-------------------------------------------
            Container(
              height: 55, //which side to show scrollbar
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 5),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 20,left: 5),
                      child: Text('Tüm Kampanyalar',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 20,left: 5),
                    child: Text('Kadın',style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 20,left: 5),
                    child: Text('Erkek',style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 20,left: 5),
                    child: Text('Ayakkabı & Çanta',style: TextStyle(fontSize: 20),),
                  ),

                ],
              ),
                  /*child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: menuListesi.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10,bottom: 20,left: 5),
                      child: Center(
                          child: Text('${menuListesi[index]}',style: TextStyle(fontSize: 20),)
                      ),
                    );
                  }
              ),*/
              ),
            //----------------------------------------------------------------------------------------
            //--------------------------------------içerik-------------------------------------------

            Expanded(
              child: Container(
                height: 500,
                color: Color(0xFFf9f4f0),
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  itemCount: resimler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                     
                      child:  Image.asset("resimler/${resimler[index]}", scale: 0.01,),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
      //----------------------------------------------------------------------------------------
      //----------------------------------------Navbar------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF685b91),
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: 'Anasayfa',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Sezon',
            icon: Icon(Icons.star_border),
          ),
          BottomNavigationBarItem(
            label: 'Sepetim',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Kategoriler',
            icon: Icon(Icons.manage_search),
          ),
          BottomNavigationBarItem(
            label: 'Hesabım',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      //----------------------------------------------------------------------------------------
    );
  }
}