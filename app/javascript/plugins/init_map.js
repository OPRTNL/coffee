
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
