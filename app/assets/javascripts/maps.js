var map;
var currentPosition;

function initialize()
{
  var mapProp = {
    center: new google.maps.LatLng(21.006645, 105.842414),
    zoom:13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  // marker_address();
  var addresses = $.parseJSON($("#map-index").attr("data-address"));
  var image = 'images/images.png'

  if(addresses.length < 1) {
    console.log('Bi loi cmnr');
  }
  else {
    console.log(addresses.length);
    // for(var i = 0; i < addresses.length; i++) {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(40.0496714, -82.9121331),
        map: map,
        icon: image
      });

      // google.maps.event.addListener(marker, 'click', (function(marker, i) {
      //   return function() {
      //     infowindow.setContent(addresses[i].name);
      //     infowindow.open(map, marker);
      //   }
      // })(marker, i));  addresses[i].lat, addresses[i].lng
    // }
  }

  map = new google.maps.Map(document.getElementById("map-index"), mapProp);
}
