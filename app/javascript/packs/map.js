import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0, disableDefaultUI: true, fullscreenControl: true });
  map.disableDefaultUI = true;
  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {
    const icon = {
      url: marker.image_url, // url
      scaledSize: new google.maps.Size(45, 45), // scaled size
    };

    console.log(marker.info_window);
    const mapMarker = map.addMarker({
      position: { lat: marker.lat, lng: marker.lng },
      icon: icon,
      infoWindow: { content: marker.info_window }
    });

  })

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

autocomplete();
