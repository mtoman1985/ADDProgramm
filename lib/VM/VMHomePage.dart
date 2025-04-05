import 'package:flutter/material.dart';
import 'package:add_programme/packages/matrices/matrices.dart';
class VMHomePage  {
  TextStyle drawerHeaderTitle=  const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.pinkAccent,
  );
  TextStyle drawerTitle= const  TextStyle(
    fontSize: 20,
    color: Colors.blue,
  );
  double drawerHeaderSizeIcon=35;
  double drawerSizeIcon=30;
  Drawer drawer(){
    return Drawer(
      backgroundColor:const Color(0xFFDAE8EF),
      shadowColor:const Color(0xFFDAE8EF),//Colors.grey,
      elevation: 10.0,
      child: ListView(children: [
        Container(
          decoration:const BoxDecoration(
              gradient:LinearGradient(
                colors:
                [
                  Colors.lightBlueAccent,
                  Colors.cyan,
                  Color(0xFFDAE8EF)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor:Colors.grey[400],
              radius: 90,
              child: Image.asset('assets/images/logo.png',
                  width: 160,
                  height:160),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(
            child: ListTile(
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 35,
                  height: 35,
                ),
              ),
              title:Text(
                'المشاريع',
                style:drawerHeaderTitle,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,),
        ListTile(
          title:Text(
            'إضافة مشروع ',
            style: drawerTitle,
          ),
          leading: const SizedBox(
              height: 80,
              child: Icon(Icons.add,size:25)
          ),
          onTap: () {
            var mat = Matrix.fromList([
              [2, 3, 3, 3],
              [9, 9, 8, 6],
              [1, 1, 2, 9]
            ]);
            print(mat.min);

            // Matrix: 3x4
            // [2.0, 3.0, 3.0, 3.0]
            // [9.0, 9.0, 8.0, 6.0]
            // [1.0, 1.0, 2.0, 9.0]

            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IncomePage()));
          },
        ),
        const SizedBox(
          height: 5,),
        ListTile(
          title:Text(
            'تعديل مشروع',
            style: drawerTitle,
          ),
          leading: const SizedBox(
              height: 80,
              child: Icon(Icons.edit,size:25)
          ),
          onTap: () {
            var mat = SquareMatrix.fromList([
              [2, 3, 3,-2,7],
              [9, 9, 8,5,6],
              [1, 8, 3,3,2],
              [-3, 7, 8,-5,7],
              [1, 1,  9,0,5]
            ]);
            print(mat.inverse);
            //print(mat.);
            //SquareMatrix: 5x5
            //[-0.08330254894717498, 0.20132988548208372, -0.2510158847432584, 0.08404137421499835, -0.1422238640561509]
            //[-0.06123014407092714, 0.05485777613594375, 0.020594754340598542, 0.09170668636867371, -0.11673439231621716]
            //[-0.14915035094200263, 0.056704839305504365, -0.07803841891392696, 0.06954192833394912, 0.07462135205024005]
            //[0.14194680458071746, -0.1678980421130404, 0.31575544883635037, -0.23522349464351694, 0.2057628370890286]
            //[0.2973771702992248, -0.15330624307351323, 0.1865533801256004, -0.16032508311784274, 0.11747321758404147]

            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IncomePage()));
          },
        ),
        const Divider(thickness:2,color:Colors.lightBlue),
        ExpansionTile(
          collapsedIconColor:Colors.pink,
          leading: SizedBox(
            height: 60,
            child: Image.asset(
              "assets/icon/warehouse.png",
              width: 35,
              height: 35,
            ),
          ),
          title:Text (
            "العناصر الإنشائية",
            style: drawerHeaderTitle,
          ),
          children: [
            ListTile(
              title:Text(
                'الأحزمة',
                style: drawerTitle,
              ),
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 45,
                  height: 45,
                ),
              ),
              onTap: () {
/*                  AllEmplyess();
              VMGlobal.MaxNoS();
              Navigator.of(context) .push(MaterialPageRoute(builder: (context) => const SalesInvoices()));
            */
              },
            ),
            const SizedBox(
              height: 5,),
            ListTile(
              title:Text(
                'الأعمدة',
                style:drawerTitle,
              ),
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 45,
                  height: 45,
                ),
              ),
              onTap: () async {
                //AllInvioces();
                await Future.delayed(const Duration(milliseconds: 500));
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SaleInvoicesReview()));
                //);
              },
            ),
            const SizedBox(
              height: 5,),
            ListTile(
              title:Text(
                'القواعد',
                style:drawerTitle,
              ),
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 45,
                  height: 45,
                ),
              ),
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                //Navigator.of(context) .push(MaterialPageRoute(builder: (context) => const ExpenseInvoices()));
              },
            ),
          ],
        ),
        ExpansionTile(
          title: Text (
            "دوال للحديد ",
            style:drawerHeaderTitle ,
          ),
          collapsedIconColor:Colors.pink,
          leading: SizedBox(
            height: 60,
            child: Image.asset(
              "assets/icon/warehouse.png",
              width: 45,
              height: 45,
            ),
          ),

          children: [
            ListTile(
              title:Text(
                'وزن السيح',
                style:drawerTitle,
              ),
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 45,
                  height: 45,
                ),
              ),
              onTap: () {
                // Navigator.of(context) .push(MaterialPageRoute(builder: (context) => const SalesInvoices()));
              },
            ),
            const SizedBox(
              height: 5,),
            ListTile(
              title: Text(
                'تحويل أقطار الحديد',
                style:drawerTitle,
              ),
              leading: SizedBox(
                height: 60,
                child: Image.asset(
                  "assets/icon/warehouse.png",
                  width: 45,
                  height: 45,
                ),
              ),
              onTap: () {
                // AllEmplyess();
                // MaxNoS();
                // Navigator.of(context) .push(MaterialPageRoute(builder: (context) => const SalesInvoices()));
              },
            ),
            const SizedBox(
              height: 5,),
          ],
        ),
      ]),
    );
  }
  ButtonStyle FirstClick =ButtonStyle(
    backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 25,fontWeight:FontWeight.bold),
    ),
    fixedSize: MaterialStateProperty.all(const Size(280, 50)),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.deepPurple,
        width: 2,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    alignment: Alignment.center,
  );
}

