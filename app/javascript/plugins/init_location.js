
const initLocation = () => {
  document.addEventListener("DOMContentLoaded", () => {
    const lat = document.getElementById('lat');
    const long = document.getElementById('long');

    if (lat == null) { return; }

    navigator.geolocation.getCurrentPosition(function(position) {
      document.getElementById('lat').value = position.coords.latitude,
      document.getElementById('long').value = position.coords.longitude
    })
  })
}

export default initLocation ;
