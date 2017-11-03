function initMap() {
    var uluru = {lat: 48.21857789999999, lng: 14.477924700000017};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 13,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
}
