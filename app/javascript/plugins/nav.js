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
  const mapNavi = new MapboxDirections({
    accessToken:  mapboxgl.accessToken,
    unit: 'metric',
    interactive: false,
    controls: {
      inputs: false,
    },
  })
  const orgLng = markers[0].lng;
  const orgLat  =   markers[0].lat;
  const wayLng = markers[1].lng;
  const wayLat  = markers[1].lat;
  const desLng = markers[2].lng;
  const desLat  = markers[2].lat;

    mapNavi.setDestination([ desLng, desLat ])
    mapNavi.setOrigin([ orgLng, orgLat])
    mapNavi.setWaypoint(0, [wayLng, wayLat]);
    map.addControl(mapNavi, 'top-left');

};
};

export { nav };
