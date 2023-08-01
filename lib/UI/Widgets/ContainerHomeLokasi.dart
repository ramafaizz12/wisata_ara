part of 'widgets.dart';

class ContainerHomeLokasi extends StatefulWidget {
  final double width;
  final double height;
  final double lat;
  final double long;
  final double zoom;
  const ContainerHomeLokasi({
    super.key,
    required this.width,
    required this.lat,
    required this.long,
    required this.height,
    required this.zoom,
  });

  @override
  State<ContainerHomeLokasi> createState() => _ContainerHomeLokasiState();
}

class _ContainerHomeLokasiState extends State<ContainerHomeLokasi> {
  GoogleMapController? mapcontrol;

  void _onMapCreated(GoogleMapController controller) {
    mapcontrol = controller;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TranslateBloc, String>(
            builder: (context, state) {
              return Text(
                state == 'id'
                    ? "Lokasi"
                    : state == 'en'
                        ? 'Location'
                        : '地点',
                style:
                    TextStyle(color: warnaorange, fontWeight: FontWeight.bold),
              );
            },
          ),
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(widget.lat, widget.long),
                      zoom: widget.zoom)),
            ),
          )
        ],
      ),
    );
  }
}
