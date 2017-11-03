function initMap() {
    var uluru = {lat: 48.2161771, lng: 14.4773338};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 13,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
}
