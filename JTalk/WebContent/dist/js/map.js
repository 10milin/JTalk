function initialize() {

        var mapOptions = {

                            zoom: 16, // 지도를 띄웠을 때의 줌 크기

                            mapTypeId: google.maps.MapTypeId.ROADMAP

                        };





        var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"

                                    mapOptions);



        var size_x = 40; // 마커로 사용할 이미지의 가로 크기

        var size_y = 40; // 마커로 사용할 이미지의 세로 크기



        // 마커로 사용할 이미지 주소

        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',

                                                    new google.maps.Size(size_x, size_y),

                                                    '',

                                                    '',

                                                    new google.maps.Size(size_x, size_y));



        // Geocoding *****************************************************

        var address = $('#address').val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.

        var marker = null;

        var geocoder = new google.maps.Geocoder();

        geocoder.geocode( { 'address': address}, function(results, status) {

            if (status == google.maps.GeocoderStatus.OK) {

                map.setCenter(results[0].geometry.location);

                marker = new google.maps.Marker({

                                map: map,

                                icon: image, // 마커로 사용할 이미지(변수)

                                title: address, // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀

                                position: results[0].geometry.location

                            });



                var content = address; // 말풍선 안에 들어갈 내용



                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~

                var infowindow = new google.maps.InfoWindow({ content: content});

                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
                	

                $('#map-canvas').css('display', 'inline-block');
            } else {

                //alert("Geocode was not successful for the following reason: " + status);

            }

        });

        // Geocoding // *****************************************************
    }