import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/text_strings.dart';
import 'package:flutter_ws_1/src/features/delivery/repos/delivery_repo.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_home.dart';
import 'package:flutter_ws_1/src/features/delivery/screens/delivery_list.dart';
import 'package:flutter_ws_1/src/features/pickup/models/shipment.dart';

enum UndelEnum { Not_Home, Re_Schedule, Re_fused }

class UnDeliveryPage extends StatefulWidget {
  const UnDeliveryPage({super.key});

  @override
  State<UnDeliveryPage> createState() => _UnDeliveryPageState();
}

class _UnDeliveryPageState extends State<UnDeliveryPage> {
  String _undelReason = '';

 void handleUpdatePicking(String id , String reason) async {
  print(_undelReason);
    if (_undelReason == '') {
      tShowDialog();
      return;
    }
    // print(shipArr.length);

    //String shipments = result;

    bool result = await DeliveryRepo.updateUnDelivery(
       id,reason);
    if (result) {
     
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DeliveryListPage()));

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('บันทึกข้อมูลสำเร็จ')));
    } else {
      tShowDialog();
      return;
    }
  }

  void tShowDialog() {
    //MyDialog(titleText: 'พบข้อผิดพลาด',contentText: 'โปรด ตรวจสอบ รหัสผ่านอีกครั้ง!!',context: context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('พบข้อผิดพลาด'),
        content: const Text('โปรดเลือก เหตุผล ที่ไม่สามารถเข้ารับได้ !!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final shipment =
        ModalRoute.of(context)!.settings.arguments as ShipmentDataModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('U N - D E L I V E R Y'),
          centerTitle: true,
            backgroundColor: Colors.grey[900],
          elevation: 0,
          
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {},
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.inventory,
                    color: Colors.green,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Text(shipment.waybill_number),
                      SizedBox(
                        width: 10,
                      ),
                      Text(shipment.shop_name),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    // Line seperate container
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(bottom: 2, top: 2),
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.5, horizontal: 1.5),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(bottom: 2, top: 2),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Wrap(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.person_pin_circle,
                              color: Colors.red,
                              size: 30,
                            ),
                            Text(shipment.customer_address.toString(),
                                style: Theme.of(context).textTheme.headline6),
                            Text(shipment.shipment_number.toString() +
                                ' : ' +
                                shipment.shipment_content.toString()),
                            Text('ลูกค้า : ' +
                                shipment.customer_name.toString()),
                            Text('โทร : ' + shipment.customer_phone.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            shipment.shipment_iscod == 'Y'
                                ? Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: const EdgeInsets.only(
                                          bottom: 2, top: 2),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.currency_bitcoin,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                          Text(
                                              'เก็บเงินปลายทาง จำนวน : ' +
                                                  shipment.shipment_cod +
                                                  ' บาท',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        )
                      ]),
                    ),
                  ),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(bottom: 2, top: 25),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(children: [
                        Text(
                          'ส่งสินค้าปลายทางไม่ผ่านเพราะ',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ]),
                    ),
                  ),

                  // Radio Box
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(bottom: 1),
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 1),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          RadioListTile(
                            contentPadding: EdgeInsets.all(2.0),
                            value: 'Not-Home',
                            groupValue: _undelReason,
                            dense: true,
                            title: Text('Not Home (ลูกค้า ไม่อยู่บ้าน/ติดต่อไม่ได้) ',
                                style: Theme.of(context).textTheme.bodyText1),
                            onChanged: (val) {
                              setState(() {
                                _undelReason = val.toString();
                                 print(_undelReason);
                              });
                            },
                          ),
                          RadioListTile(
                              contentPadding: EdgeInsets.all(2.0),
                            value: 'Re-Schedule',
                            dense: true,
                            groupValue: _undelReason,
                            title: Text('Re-Schedule (ลูกค้า เลื่อนวันรับ) ',
                                style: Theme.of(context).textTheme.bodyText1),
                            onChanged: (val) {
                              setState(() {
                                _undelReason = val.toString();
                                 print(_undelReason);
                              });
                            },
                          ),
                          RadioListTile(
                              contentPadding: EdgeInsets.all(2.0),
                            value: 'Re-Fused',
                            dense: true,
                            groupValue: _undelReason,
                            title: Text('Refused (ลูกค้า ยกเลิก/ปฏิเสธการรับ) ',
                                style: Theme.of(context).textTheme.bodyText1),
                            onChanged: (val) {
                              setState(() {
                                _undelReason = val.toString();
                                print(_undelReason);
                              });
                            },
                          ),
                          RadioListTile(
                            contentPadding: EdgeInsets.all(2.0),
                            value: 'Change-Address',
                            groupValue: _undelReason,
                            dense: true,
                            title: Text('Change Addr (แจ้งเปลี่ยนที่อยู่จัดส่ง) ',
                                style: Theme.of(context).textTheme.bodyText1),
                            onChanged: (val) {
                              setState(() {
                                _undelReason = val.toString();
                                 print(_undelReason);
                              });
                            },
                          ),
                              RadioListTile(
                            contentPadding: EdgeInsets.all(2.0),
                            value: 'Brand-Cancel',
                            groupValue: _undelReason,
                            dense: true,
                            title: Text('Brand Cancel (แบรนด์แจ้งยกเลิกออเดอร์) ',
                                style: Theme.of(context).textTheme.bodyText1),
                            onChanged: (val) {
                              setState(() {
                                _undelReason = val.toString();
                                 print(_undelReason);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Btt
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                        onPressed: () {
                           Navigator.pop(context);
                        },
                        child: Text(tCancel.toUpperCase()),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                             handleUpdatePicking(shipment.shipment_id,_undelReason);
                          },
                          child: Text(tSave.toUpperCase()),
                        ),
                      ),
                    ],
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
