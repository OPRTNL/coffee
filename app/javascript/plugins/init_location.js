
const initLocation = () => {
  const formGeolocation = document.querySelector('#geoloc-form form');

  if (formGeolocation) {
    document.querySelector('#geolocation-submit').addEventListener("click", () => {
      const lat = document.getElementById('lat');
      const long = document.getElementById('long');

      if (lat == null) { return; }

      navigator.geolocation.getCurrentPosition(function(position) {
        lat.value = position.coords.latitude;
        console.log(lat)
        long.value = position.coords.longitude;
        console.log(long)

        formGeolocation.submit();
      })
    })
  }
}

export default initLocation ;
