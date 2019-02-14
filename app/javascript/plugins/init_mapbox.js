import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 50, maxZoom: 14 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    const markers = JSON.parse(mapElement.dataset.markers);
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    center: [markers[0].lng, markers[0].lat],
    style: 'mapbox://styles/uhmie/cjruq2ggj0q2k1ftbsktluram'
  });
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup({
      closeButton: false,
      closeOnClick: true
    }).setText(marker.infoWindow);
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });
  fitMapToMarkers(map, markers);
  // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
};
};
export { initMapbox };
