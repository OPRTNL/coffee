
// import googleMaps from '@google/maps'
// const google = googleMaps.createClient({
//   key: 'AIzaSyB1Pe9CbiCnb7zgQymje9M6GgHWgXzCq-4'
// });

function initMap() {

  const mapElement = document.getElementById('map');
  // The location of Uluru
  var markerelement = JSON.parse(mapElement.dataset.markers);
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 19, center: markerelement});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: markerelement , map: map});}

export default initMap ;
