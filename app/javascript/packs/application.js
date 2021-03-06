import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


import { initAutocomplete } from '../plugins/init_autocomplete';
import { init_slider } from "../plugins/slider.js";
import { nav } from "../plugins/nav.js";
import { PlaySound } from "../plugins/play_sound.js";

initMapbox();
initAutocomplete();
init_slider("#route_radius");
// hide_address();
nav();
