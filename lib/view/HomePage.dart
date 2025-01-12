import 'package:api_l3_nullsafty/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Complex json '),
      backgroundColor: Colors.cyan.shade100,),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: api.getUserApi(),
                  builder: (context, AsyncSnapshot<List<userModel>> snapshot){
                    if(!snapshot.hasData){
                      return Center(
                          heightFactor: 120,
                          widthFactor: 120,
                          child: CircularProgressIndicator());
                    }else{
                      return ListView.builder(
                          itemCount: api.userList.length,
                          itemBuilder:(context,index){
                            var datas = snapshot.data![index];
                            //data ke andar  addres
                            var address = datas.address;
                            // address ke andar Geo
                            var geo = address!.geo;
                            // data ke andar compny
                            var compny = datas.company;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SizedBox(height: 10,),
                                      Text("userDetails",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                                       RowReuse(title: "name", value: datas.name.toString()),
                                       RowReuse(title: "username", value: datas.username.toString()),
                                       RowReuse(title: "email", value: datas.email.toString()),
                                       RowReuse(title: "phone", value: datas.phone.toString()),
                                       // adress
                                  //var address = datas.address;
                                    Text("Address",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                                       RowReuse(title: "city", value: datas.address!.city.toString()),
                                       RowReuse(title: "zipcode", value: address!.zipcode.toString()),
                                       RowReuse(title: "street", value: address!.street.toString()),
                                    //adress ke andar Gep
                                  //var geo = address!.geo;
                                    RowReuse(title: "lat - lng",
                                        value: datas.address!.geo!.lat.toString() +" - " +geo!.lng.toString()),
                                   //RowReuse(title: "lng", value: geo!.lng.toString()),

                                // data ke andar compny
                                //var compny = datas.company;
                                    Text("CompnyDetails",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                                    RowReuse(title: "company", value: datas.company!.name.toString()),
                                    RowReuse(title: "bs", value: compny!.bs.toString()),
                                    RowReuse(title: "catchPhrase", value: compny!.catchPhrase .toString()),
                                    //

                                  ],
                                ),
                              ),
                            ) ;
                          }
                      );
                    }

                  }
                  )
          )

        ],
      ),
    );


  }
}

class RowReuse extends StatelessWidget {
  String title ,value ;
   RowReuse({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child:  Text(value),
              )
            ],
          )
        ],
      ),
    );
  }
}

