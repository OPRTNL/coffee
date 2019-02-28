
// import googleMaps from '@google/maps'
// const google = googleMaps.createClient({
//   key: 'AIzaSyB1Pe9CbiCnb7zgQymje9M6GgHWgXzCq-4'
// });

function initMap() {

  const mapElement = document.getElementById('map');

  var markerelement = JSON.parse(mapElement.dataset.markers);

  console.log(markerelement)

  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: markerelement[0]});

  markerelement.forEach((marker) => {
    return new google.maps.Marker({position: marker , map: map})
  });

    const bounds = new google.maps.LngLatBounds();
    markerelement.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bound);

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
