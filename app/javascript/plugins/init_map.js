
import googleMaps from '@google/maps'
// const google = googleMaps.createClient({
//   key: 'AIzaSyB1Pe9CbiCnb7zgQymje9M6GgHWgXzCq-4'
// });

let map
const markers = []

function initMap() {

  const mapElement = document.getElementById('map');

   if (mapElement == null) { return; }

  const markerelements          = JSON.parse(mapElement.dataset.markers)
  const markerBounds            = new google.maps.LatLngBounds()
  map                           = new google.maps.Map(mapElement)
  const iconBase                = 'https://image.flaticon.com/icons/png/256/1079/'
  let   currentOpenedInfoWindow = null

  markerelements.forEach((markerData) => {
    const infowindow  = new google.maps.InfoWindow({content: markerData.infoWindow})
    const marker      = new google.maps.Marker({position: markerData , map: map, icon: {url: iconBase + '1079115.png', scaledSize: new google.maps.Size(70,70)}})

    console.log({"id": markerData.partnerId, "marker": marker})
    markers.push(marker)
    // console.log(markers)
    markerBounds.extend(new google.maps.LatLng(markerData))

    marker.addListener('click', function() {
      if (currentOpenedInfoWindow != null) {
        currentOpenedInfoWindow.close()
      }
      infowindow.open(map, marker)
      currentOpenedInfoWindow = infowindow
    })
  })

  if (markerelements.length > 1) {
    map.fitBounds(markerBounds);
  } else {
    map.setCenter(markerelements[0])
    map.setZoom(16)
  }
}

const focusOnMarker = (partnerId) => {
  console.log(`je dois focus sur le parter ${partnerId}`)
  console.log(partnerId)
  console.log("map", map)
  console.log("markers", markers)
}


export {initMap, focusOnMarker} ;




// function initMap() {

//   const mapElement = document.getElementById('map');

//   var markers = JSON.parse(mapElement.dataset.markers);

//   var map = new google.maps.Map(mapElement, {zoom: 19, center: 'paris'});

//   markers.forEach((marker) => {
//     new google.maps.Marker({position: marker , map: map})
//   });
// }

// export default initMap();
