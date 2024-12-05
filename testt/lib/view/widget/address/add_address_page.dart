import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/widget/address/address_form.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget finishButton = InkWell(
      onTap:(){},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorApp.logo,
                offset: Offset(0, 5),
                blurRadius: 1.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Finish",
              style: const TextStyle(
                  color:  Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.logo,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ColorApp.gray800),
        title: Text(
          'Add Address',
          style: TextStyle(
              color: ColorApp.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
              fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).padding.bottom == 0
                      ? 20
                      : MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.white,
                          elevation: 3,
                          child: SizedBox(
                              height: 100,
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                          'images/icons/address_home.png'),
                                    ),
                                    Text(
                                      'Add New Address',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: ColorApp.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ))),
                      Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: ColorApp.logo,
                          elevation: 3,
                          child: SizedBox(
                              height: 80,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'images/icons/address_home.png',
                                        color: Colors.white,
                                        height: 20,
                                      ),
                                    ),
                                    Text(
                                      'Simon Philip,\nCity Oscarlad',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ))),
                      Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: ColorApp.logo,
                          elevation: 3,
                          child: SizedBox(
                              height: 80,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                          'images/icons/address_work.png',
                                          color: Colors.white,
                                          height: 20),
                                    ),
                                    Text(
                                      'Workplace',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )))
                    ],
                  ),
                  AddAddressForm(),
                  Center(child: finishButton)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
