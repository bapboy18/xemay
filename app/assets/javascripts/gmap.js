var map;
var currentPosition;
var marker;

function initialize()
{
  var mapProp = {
    center: new google.maps.LatLng(51.508742,-0.120850),
    zoom:16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  getLocation();
  google.maps.event.addListener(map,'click',function(event) {
    currentPosition = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());
    marker.setPosition(currentPosition);
  });
}

function loadScript()
{
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=&sensor=false&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;

function getLocation() {
  // Check user co latlng chua
  if ($("#user_lat").val() == ""){

  // trong truong hop user chua co lat lng
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
  }else {
    // truong da co lat lng
    var location = new google.maps.LatLng($("#user_lat").val(),$("#user_lng").val());
    marker = new google.maps.Marker({
      position: location,
      map: map,
    });
    map.setCenter(location);
  }
}

function showPosition(position){
  var location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  marker = new google.maps.Marker({
    position: location,
    map: map,
  });

  map.setCenter(location);
  currentPosition = {lat: position.coords.latitude, lng: position.coords.longitude};
}

$(document).ready(function(){
  $("form").submit(function(){
    $("#user_lat").val(currentPosition.lat);
    $("#user_lng").val(currentPosition.lng);
  });
})
