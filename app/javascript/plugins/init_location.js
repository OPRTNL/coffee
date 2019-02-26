
const initLocation = () => {

document.addEventListener("DOMContentLoaded", () => {

  navigator.geolocation.getCurrentPosition(function(position) {
  console.log(position.coords.latitude, position.coords.longitude);

});
});
};

export default initLocation ;
