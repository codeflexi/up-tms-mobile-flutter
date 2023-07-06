import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text("ระบบขนส่ง"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
// IconButton(icon: const Icon(Icons.menu_book),onPressed: () {},),
          ],
          elevation: 0,
          backgroundColor: Colors.red,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "TMS System1",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "TMS System2",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "TMS System3",
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                "TMS System4",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "TMS System6",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "Sub-heading พร้อม",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                "Paragrapth ขี้นระบบ",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Paragrapth ขี้นระบบ",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      print("Tuk clicked2");
                    },
                    child: Text(tSignup.toUpperCase()),
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      print("Tuk clicked1");
                    },
                    child: Text(tLogin.toUpperCase()),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
