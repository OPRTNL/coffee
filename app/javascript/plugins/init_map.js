
// import googleMaps from '@google/maps'
// const google = googleMaps.createClient({
//   key: 'AIzaSyB1Pe9CbiCnb7zgQymje9M6GgHWgXzCq-4'
// });

function initMap() {

  const mapElement = document.getElementById('map');

   if (mapElement == null) { return; }

  const markerelements = JSON.parse(mapElement.dataset.markers);
  const markerBounds = new google.maps.LatLngBounds();
  const map = new google.maps.Map(mapElement)

  const iconBase = 'https://cdn1.iconfinder.com/data/icons/Keyamoon-IcoMoon--limited/32/';

  console.log(markerelements.infowindow)

  markerelements.forEach((marker) => {
    var infowindow = new google.maps.InfoWindow({
    content: marker.infoWindow
    });

    var the = new google.maps.Marker({position: marker , map: map, icon: iconBase + 'coffee.png'})

    markerBounds.extend(new google.maps.LatLng(marker))

    the.addListener('click', function() {
    infowindow.close(map);
    infowindow.open(map, the);
    });
  });

  if (markerelements.length > 1) {
    map.fitBounds(markerBounds);
  } else {
    map.setCenter(markerelements[0])
    map.setZoom(16)
  }

}

export default initMap ;




// function initMap() {

//   const mapElement = document.getElementById('map');

//   var markers = JSON.parse(mapElement.dataset.markers);

//   var map = new google.maps.Map(mapElement, {zoom: 19, center: 'paris'});

//   markers.forEach((marker) => {
//     new google.maps.Marker({position: marker , map: map})
//   });
// }

// export default initMap();
