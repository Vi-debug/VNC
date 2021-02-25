import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/welcome_screen/detail_product.dart';

class WelcomeScreen extends StatelessWidget {
  final listObject = <Widget>[
    DetailProduct(),
    DetailProduct(),
    DetailProduct(),
    DetailProduct(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            'X',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLogin', false);
            Navigator.of(context).pushNamed('/login');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 12),
                              suffixIcon: Icon(Icons.search),
                              hintText: 'Tìm kiếm ...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 32,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/welcome_pic_1.png'),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset('assets/images/discount.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'FlashSale',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/lightning.png'),
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 15,
                        width: 15,
                        color: Colors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 15,
                        width: 15,
                        color: Colors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 15,
                        width: 15,
                        color: Colors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 15,
                        width: 15,
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Xem thêm >',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listObject.length,
                      itemBuilder: (context, index) {
                        return listObject[index];
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Combo',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listObject.length,
                      itemBuilder: (context, index) {
                        return listObject[index];
                      },
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 8,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sản phẩm mới',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 700,
                    width: size.width,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      children: List.generate(6, (index) => DetailProduct()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
