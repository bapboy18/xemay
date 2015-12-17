var map;
var currentPosition;

function initialize()
{
  var mapProp = {
    center: new google.maps.LatLng(21.006645, 105.842414),
    zoom:13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var addresses = $.parseJSON($("#map-index").attr("data-address"));
  var markers = [];
  map = new google.maps.Map(document.getElementById("map-index"), mapProp);

  if(addresses.length < 1) {
    console.log('Bi loi roi');
  }
  else {

    for (i = 0; i < addresses.length; i++) {
      markers[i] = new google.maps.Marker({
        position: new google.maps.LatLng(addresses[i].lat, addresses[i].lng),
        map: map
      });

      markers[i].setMap(map);
    }
  }
}

function loadScript()
{
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=&sensor=false&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;
