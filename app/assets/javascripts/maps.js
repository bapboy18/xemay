var map;
var currentPosition;
var infowindows = [];

function initialize()
{
  var mapProp = {
    center: new google.maps.LatLng(21.006645, 105.842414),
    zoom:13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var addresses = $.parseJSON($("#map-index").attr("data-address"));
  var reviews = $.parseJSON($("#map-index-reviews").attr("data-review"));
  var markers = [];
  map = new google.maps.Map(document.getElementById("map-index"), mapProp);

  if(addresses.length < 1) {
    console.log('Bi loi roi');
  }
  else {
    for (i = 0; i < addresses.length; i++) {
    var add = addresses[i];
    var rv = reviews[i];
    console.log(add.review_name);
      markers[i] = new google.maps.Marker({
        position: new google.maps.LatLng(addresses[i].lat, addresses[i].lng),
        map: map
      });
      var markerContent = '<div class="container">' +
                            '<div class="row">' +
                              '<p>' + rv.name + '</p>' +
                            '</div>' +

                            '<div class="row">' +
                              '<p>' + add.name + '</p>' +
                            '</div>' +

                            '<div class="row">' +
                              '<span>Phone number: </span>' +
                              '<span>' + rv.phone_number + '</span>' +
                            '</div>' +

                            '<div class="row">' +
                              '<p>' + rv.content + '</p>' +
                            '</div>' +
                          '</div>';
      infowindows [i] = new google.maps.InfoWindow({
        maxWidth: 300
      });
      bindInfoWindow(markers[i], map, infowindows[i], markerContent);
    };
  };
}

function bindInfoWindow(marker, map, infowindow, markerContent) {
  marker.addListener('click', function() {
    infowindow.setContent(markerContent);
    infowindow.open(map, this);
  });
}

function loadScript()
{
  var script = document.createElement("script");
  script.type = "text/javascript";
  // script.src = "http://maps.googleapis.com/maps/api/js?key=&callback=initialize";
  script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;
