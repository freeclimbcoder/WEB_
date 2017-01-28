

ymaps.ready(function () {
    var myMap = new ymaps.Map('map', {
        center: [59.93, 30.34], // СПБ
        zoom: 10,
        controls: ['zoomControl']
    });

    var kazShop = new ymaps.Placemark([59.930664, 30.316492], {
        balloonContent: 'Магазин Казанская 25'

    });
    var nevShop = new ymaps.Placemark([59.935683, 30.321924], {
        balloonContent: 'Магазин Невский 21'
    });
    var vetShop = new ymaps.Placemark([59.832582, 30.172078], {
        balloonContent: 'Проспект Ветеранов 130'
    });

    myMap.geoObjects
            .add(kazShop)
            .add(nevShop)
            .add(vetShop);

    vetShop.events.add('click', function () {
        document.getElementById('addr_2').checked = true;
    });
    kazShop.events.add('click', function () {
        document.getElementById('addr_1').checked = true;
    });
    nevShop.events.add('click', function () {
        document.getElementById('addr_3').checked = true;
    });
});