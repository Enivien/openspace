function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var spaceLocation = document.getElementById('space_location');

    if (spaceLocation) {
      var autocomplete = new google.maps.places.Autocomplete(spaceLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(spaceLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
