import "bootstrap";
import initAutocomplete from "../plugins/init_autocomplete.js"
import initLocation from "../plugins/init_location.js"
import { initMap, focusOnMarker } from "../plugins/init_map.js"
import { initToogle, toogle } from "../plugins/init_toogle.js"

// // console.log('Hello World from Webpacker');
initAutocomplete();
initLocation();
initToogle(focusOnMarker);
window.initMap = initMap




document.addEventListener('marker-clicked', (event) => {
  toogle(event.detail)
});
