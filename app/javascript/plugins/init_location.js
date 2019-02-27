
const initLocation = () => {

document.addEventListener("DOMContentLoaded", () => {

  navigator.geolocation.getCurrentPosition(function(position) {
  document.getElementById('lat').value = position.coords.latitude,
  document.getElementById('long').value = position.coords.longitude
  ;
});
});
};

  // document.getElementById('gps').submit();

export default initLocation ;
