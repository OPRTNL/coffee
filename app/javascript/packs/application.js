import "bootstrap";
import initAutocomplete from "../plugins/init_autocomplete.js"
import initLocation from "../plugins/init_location.js"
import initMap from "../plugins/init_map.js"
import initToogle from "../plugins/init_toogle.js"

// // console.log('Hello World from Webpacker');
initAutocomplete();
initLocation();
initToogle();
window.initMap = initMap


