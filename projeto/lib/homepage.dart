import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () => {
                  Navigator.pop(context),
                }),
        title: Text("Ciclismo por São Paulo"),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  // Posição inicial da camera de acordo com o a latitude e longituda da cidade
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(-23.6821604, -46.8755058), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(-23.6821604, -46.8755058), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://abcreporter.com.br/wp-content/uploads/2020/07/Paranapiacaba-Foto-Alex-Cavanha_PSA.jpg",
                  -23.7787867,
                  -46.314059,
                  "Paranapiacaba",
                  "51,3 Km",
                  "Pedal saindo da estação Pedro II \n até Paranapiacaba."),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://naturam.com.br/wp-content/uploads/2017/03/santos-principal.jpg",
                  -23.9677481,
                  -46.3554473,
                  "Santos Litoral",
                  "70,8 Km",
                  "Pedal saindo da estação Santos-Imigrantes \n até Santos litoral."),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://f.i.uol.com.br/fotografia/2019/01/16/15476709465c3f95a252c1f_1547670946_3x2_xl.jpg",
                  -23.3192844,
                  -46.634181,
                  "Cachoeira da Caceia",
                  "12,8 Km",
                  "Pedal saindo da estação Franco da Rocha \n até a cachoeira da Caceia."),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.translimamotoservice.com.br/wp-content/uploads/2018/04/Motoboy-Em-S%C3%A3o-Roque-SP-1024x812.jpg",
                  -23.5317821,
                  -47.1379436,
                  "São Roque - SP",
                  "25 Km",
                  "Pedal saindo da estação Itapevi \n até a cidade de São Roque."),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.pinimg.com/736x/7d/a5/e2/7da5e2ef324063c4c4ed986109302843.jpg",
                  -23.5553244,
                  -46.6353793,
                  "Bairro da Liberdade",
                  "27,4 Km",
                  "Pedal saindo de Casa \n até a feira da Liberdade-SP."),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.adsttc.com/media/images/5747/0d11/e58e/cef2/ff00/0020/medium_jpg/_FC_2649_-_Paulo_Pereira.jpg?1464274182",
                  -23.6586406,
                  -46.7224133,
                  "Bayer",
                  "31 Km",
                  "Pedal saindo de Casa \n até a Bayer pela ciclovia CPTM."),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String pedalname,
      String km, String desc) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(pedalname, km, desc),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String pedalname, String km, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              pedalname,
              style: TextStyle(
                  color: Color(0xff337b52),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  km,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  desc,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(-23.6821604, -46.8755058), zoom: 10),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          paranapiacaba,
          santos,
          caceia,
          saoroque,
          liberdade,
          bayer,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

// Adicão de marcações
Marker paranapiacaba = Marker(
  markerId: MarkerId('paranapiacaba'),
  position: LatLng(-23.7787867, -46.314059),
  infoWindow: InfoWindow(title: 'Pedal Paranapiacaba'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker santos = Marker(
  markerId: MarkerId('santos'),
  position: LatLng(-23.9677481, -46.3554473),
  infoWindow: InfoWindow(title: 'Pedal Santos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker caceia = Marker(
  markerId: MarkerId('caceia'),
  position: LatLng(-23.3192844, -46.634181),
  infoWindow: InfoWindow(title: 'Pedal Cachoeira Caceia'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker saoroque = Marker(
  markerId: MarkerId('saoroque'),
  position: LatLng(-23.5317821, -47.1379436),
  infoWindow: InfoWindow(title: 'Pedal São Roque'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker liberdade = Marker(
  markerId: MarkerId('liberdade'),
  position: LatLng(-23.5553244, -46.6353793),
  infoWindow: InfoWindow(title: 'Pedal Liberdade'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker bayer = Marker(
  markerId: MarkerId('bayer'),
  position: LatLng(-23.6586406, -46.7224133),
  infoWindow: InfoWindow(title: 'Pedal Bayer'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
