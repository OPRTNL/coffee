
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
  const iconBase                = 'https://image.flaticon.com/icons/png/256/'
  let   currentOpenedInfoWindow = null

  markerelements.forEach((markerData) => {
    const infowindow  = new google.maps.InfoWindow({content: markerData.infoWindow})
    const marker      = new google.maps.Marker({position: markerData , map: map, icon: {url: iconBase + '1079/1079115.png', scaledSize: new google.maps.Size(70,70)}})



    // console.log(marker)
    markers.push({"partnerId": markerData.partnerId, "marker": marker})
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
// console.log(markers)
let currentMarker = null

const focusOnMarker = (partnerId) => {

  const iconBase = 'https://image.flaticon.com/icons/png/256/'

  const marker = markers.find((element) => { return element.partnerId == partnerId }).marker
  console.log(marker)
  marker.setIcon({url: iconBase + '252/252025.png', scaledSize: new google.maps.Size(70,70)})
  if (currentMarker != null) {
    currentMarker.setIcon({url: iconBase + '1079/1079115.png', scaledSize: new google.maps.Size(70,70)})
  }
  currentMarker = marker
  map.panTo(marker.position)
  map.setZoom(15)
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
