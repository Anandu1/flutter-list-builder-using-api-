import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
  List sports;
  List list;


  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull(
          "http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10"),

    );
    if(response.statusCode==200){
    setState(() {
      data =json.decode(response.body);

    });
    


  }}
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sports"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle),
            ),
          ],
          leading:IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
          ),

        ),
        body:
        ListView.builder(shrinkWrap: true,
            itemCount:data==null ?0: data.length,
            itemBuilder: (BuildContext context,int index ){
              return new Card(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Name :",style: TextStyle(color: Colors.black,fontSize: 20),),
                        ),
                        Text(data[index]["name"],style: TextStyle(color: Colors.red,fontSize: 20),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Created On :"),
                        ),
                        Text(data[index]["createOn"],style: TextStyle(color: Colors.green),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Updated On :"),
                        ),
                        Text(data[index]["updatedOn"],style: TextStyle(color: Colors.red),),
                      ],
                    ),



                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Open Time :"),
                        ),
                        Text(data[index]["openTime"],style: TextStyle(color: Colors.orange),),
                      ],
                    ), Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Close Time :"),
                        ),
                        Text(data[index]["closeTime"],style: TextStyle(color: Colors.orange),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Slot Time Size:"),
                        ),
                        Text(data[index]["slotTimeSize"].toString(),style: TextStyle(color: Colors.brown),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Cost Per Slot :"),
                        ),
                        Text(data[index]["costPerSlot"].toString(),style: TextStyle(color: Colors.blue),),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ID:"),
                        ),
                        Text(data[index]["id"].toString()),
                      ],
                    ),





                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        data[index]["images"] != null ? Image.network(data[index]["images"][index],width: 100,) : Container(),
                        data[index]["images"] != null ? Image.network(data[index]["images"][index+1],width: 100,) : Container(),
                        data[index]["images"] != null ? Image.network(data[index]["images"][index+2],width: 100,) : Container(),


                      ],
                    ),

                    data[index]["active"] != null ? Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("active:"),
                        ),
                        Text(data[index]["active"],style: TextStyle(color: Colors.orange),),
                      ],
                    )
                        : Container(child:Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Active :"),
                      ),
                        Text("No data Available",style: TextStyle(color: Colors.orange),),
                      ],
                    )),


                    data[index]["establishment"] != null ? Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("active:"),
                        ),
                        Text(data[index]["establishment"],style: TextStyle(color: Colors.orange),),
                      ],
                    )
                        : Container(child:Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Establishment :"),
                      ),
                        Text("No data Available",style: TextStyle(color: Colors.orange),),
                      ],
                    )),
                    data[index]["sports"]["createOn"]!=null ?  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("create On:"),
                        Text(data[index]["sports"]["createOn"]),
                      ],
                    ) : Container(child: Row(mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Text("Create On :",),
                        Text("No data available",style: TextStyle(color: Colors.orange),),
                      ],
                    ),),
                    data[index]["sports"]["updateOn"]!=null ?  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Update On:"),
                        Text(data[index]["sports"]["updateOn"]),
                      ],
                    ) : Container(child: Row(mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Text("Update On :",),
                        Text("No data available",style: TextStyle(color: Colors.orange),),
                      ],
                    ),),
                    data[index]["sports"]["id"]!=null ?  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID:"),
                        Text(data[index]["sports"]["id"].toString(),style: TextStyle(color: Colors.pink),),
                      ],
                    ) : Container(child: Text("ID :No data"),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Sports :",style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold),),
                          data[index]["sports"]["iconWhiteUrl"]!=null ?

                          Container(color: Colors.blue,
                              child: Image.network(data[index]["sports"]["iconWhiteUrl"],height: 25,width: 25,))
                              : Container(child: Text("Image :No data"),),
                          data[index]["sports"]["name"]!=null ?  Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data[index]["sports"]["name"].toString()),
                            ],
                          ) : Container(child: Text("Name :No data"),),

                          data[index]["sports"]["iconWhiteUrl"]!=null ?
                          Image.network(data[index]["sports"]["iconBlackUrl"],height: 25,width: 25,)
                              : Container(child: Text("Image :No data"),),

                        ],
                      ),
                    ),




                  ],
                ),
              );
            })
    );
  }
}