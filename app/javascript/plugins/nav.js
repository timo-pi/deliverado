import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import MapboxDirections  from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions";
import "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css";


function nav(){
   const mapElement = document.getElementById('mapNav');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 100, maxZoom: 14 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'mapNav',
    style: 'mapbox://styles/uhmie/cjruq2ggj0q2k1ftbsktluram'
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
  });
  fitMapToMarkers(map, markers);
  // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
  const mapNav = new MapboxDirections({
    accessToken:  mapboxgl.accessToken,
    unit: 'metric',
    interactive: false,
    controls: {
      inputs: false,
    },
  })
  mapNav.setDestination([11.386232, 48.747116 ])
  mapNav.setOrigin([11.6021119, 48.1400201])
  map.addControl(mapNav, 'top-left');
};
};

export { nav };
