$(function () {

    // full screen
    const enterFullscreenBtn = document.querySelector('.enterFullscreenBtn')
    const container = document.querySelector('.wrap')
    enterFullscreenBtn.addEventListener('click', e => {
        fullscreen(container)
    })
    const fullscreen = element => {
        if (element.requestFullscreen) return element.requestFullscreen()
        if (element.webkitRequestFullscreen) return element.webkitRequestFullscreen()
        if (element.mozRequestFullScreen) return element.mozRequestFullScreen()
        if (element.msRequestFullscreen) return element.msRequestFullscreen()
    }
    //nav naming
    if ($('.wrap').hasClass('ui-class2-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class2-science')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class2-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class2-social')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class2-korean')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class3-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class2-math')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class3-korean')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-class3-math')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-test2-class2-math')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-test2-class2-science')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('test02-class3-korean')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-test2-class2-korean')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-test2-class3-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('ui-test2-class3-math')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
        // !!!!!!!!!!!!!!!!!!!!!!!!!!! 초등 2회 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    } else if ($('.wrap').hasClass('test02-class1-korean')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('class-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('class-math')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('test02-class1-social')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('test02-class1-science')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
        // !!!!!!!!!!!!!!!!!!!!!!!!! 중등 2회차 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    } else if ($('.wrap').hasClass('ui-test2-class2-english')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else if ($('.wrap').hasClass('class-science')) {
        var bullet = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50'];

        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (bullet[index]) + "</span>";
                },
            },
        });
    } else {
        var swiper = new Swiper(".mySwiper", {
            allowTouchMove: false,
            initialSlide: document.getElementById('start_number').value,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '" id="swiper' + index + '">' + (index + 1) + "</span>";
                },
            },
        });
    }

    swiper.on('slideChange', (ev) => {
        const progressTime = saveTime - time;
        const previousIndex = ev.previousIndex;
        insertItemResult(previousIndex, progressTime);
        saveTime = time;
        const audioList = document.querySelectorAll('audio');
        const videoList = document.querySelectorAll('video');
        const previousItemId = swiper.slides[ev.previousIndex].querySelector('input[name=item_id]').value;
        const previousRelationId = swiper.slides[ev.previousIndex].querySelector('input[name=relation_id]').value;
        const currentItemId = swiper.slides[ev.realIndex].querySelector('input[name=item_id]').value;
        const currentRelationId = swiper.slides[ev.realIndex].querySelector('input[name=relation_id]').value;
        if (previousItemId !== currentRelationId && previousRelationId !== currentItemId) {
            audioList.forEach((item, index) => {
                item.pause();
            });

            videoList.forEach((item, index) => {
                item.pause();
            })

        }
    });

    //drawing
    var nowIndex;

    swiper.on('transitionEnd', function (idx) {
        nowIndex = swiper.realIndex
        let $canvas;
        let context;

        $('.drawing-btn').on('click', function () {
            $canvas = $('.swiper-slide ').eq(nowIndex).find($('.sketchpad'));
            context = $canvas[0].getContext('2d');
            let color = $('#ECD13F');
            let lastEvent,
                mousedown = false;

            $canvas
                .mousedown(function (event) {
                    lastEvent = event;
                    mousedown = true;
                })
                .mousemove(function (event) {
                    if (mousedown) {
                        // Draw lines
                        context.beginPath();
                        context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
                        context.lineTo(event.offsetX, event.offsetY);
                        context.strokeStyle = 'rgba(255,255,0)';
                        context.stroke();
                        context.lineWidth = 22;
                        lastEvent = event;
                    }
                })
                .mouseup(function (event) {
                    mousedown = false;
                })

                .mouseleave(function (event) {
                    mousedown = false;
                });

            _this.toggleClass('active');

            if (_this.hasClass('active')) {
                clearBtn.show('slide', 400);
                $canvas.show();
                $('.sketchpad').removeClass('disabled');
            } else {
                clearBtn.hide('slide', 400);
                context.clearRect(0, 0, 1260, 1216);
                // $canvas.hide();
                $('.sketchpad').addClass('disabled');
            }

        })

        $('.clear-btn').on('click', function () {
            context.clearRect(0, 0, 1260, 1216);
        })
    })

    // drag and drop

    let isProcessing = false;

    let txt;
    $('.ui-drag-txt .drag').on({
        //드래그 시작시 요소 id 저장
        'dragstart': function (e) {
            txt = $(this).text();


            $(this).css('border', 'solid 1px #ccc');

            if ($(this).parents('.ui-drag-txt').hasClass('type02')) {
                data = $(this).data('name');
            }
        },
        //드래그 종료
        'dragend': function (e) {

            // let name = $('.drop.on').find('span').text();
            // $(".drag[data-name='" + name + "']").css('opacity', '0.5')

            let name = $(this).data('name');

            let num = $(this).parents('.page').find('.ui-drop-txt .drop span').length;

            // if($('.ui-drop-txt .drop').find('span').text() == name) {
            //   console.log('1')
            //   $(".drag[data-name='" + name + "']").css('opacity', '0.5');
            //   $(".drag[data-name='" + name + "']").attr('draggable', 'false');
            // } else if(num > 1) {
            //   console.log('2')
            //   $(".drag[data-name='" + name + "']").css('opacity', '0.5');
            //   $(".drag[data-name='" + name + "']").attr('draggable', 'false');
            // }
            if (isProcessing === true) {
                $(this).css('opacity', '0.5');
                $(this).attr('draggable', 'false');
                isProcessing = false;
            }
            /*
            if($('.ui-drop-txt .drop').find('span').text() == name) {
              $(".drag[data-name='" + name + "']").css('opacity', '0.5');
              $(".drag[data-name='" + name + "']").attr('draggable', 'false');
            } else if(num > 1) {
              console.log(isProcessing);
              if(isProcessing === true){
                $(".drag[data-name='" + name + "']").css('opacity', '0.5');
                $(".drag[data-name='" + name + "']").attr('draggable', 'false');
                isProcessing = false;
              }
            } else if($('.ui-drop-txt .drop').find('span').data('name') == name) {
              $(".drag[data-name='" + name + "']").css('opacity', '0.5');
              $(".drag[data-name='" + name + "']").attr('draggable', 'false');
            }
      */
        }


    });

    $('.ui-drop-txt .drop').on({
        'dragenter': function (e) {

        },
        //브라우저 표중 동작 취소
        'dragover': function (e) {
            e.preventDefault();
        },
        'drop': function (e) {
            // $(this).append('<span class="txt">' + txt + '</span>');
            //
            // if($(this).parents('.ui-drop-txt').hasClass('type02')) {
            //   $(this).append('<span class="txt" data-name="' + data +'">' + txt + '</span>');
            // }
            if ($(this).parents('.ui-drop-txt').hasClass('type02')) {
                $(this).append('<span class="txt" data-name="' + data + '">' + txt + '</span>');
            } else {
                $(this).append('<span class="txt">' + txt + '</span>');
            }

            e.preventDefault();
            let num = $(this).find('span').length;
            let name = $(this).find('span').text();
            isProcessing = true;

            $(this).addClass('on')

            if (num > 1) {
                let dataName = $(this).find('span').data('name');
                let text = $(this).find('span:first-child()').text();
                $(this).find('span:first-child()').remove();
                // $(".drag[data-name='" + text + "']").css('opacity', '1');
                // $(".drag[data-name='" + text + "']").attr('draggable', 'true');
                if ($(this).parents('.ui-drop-txt').hasClass('type02')) {
                    $(".drag[data-name='" + dataName + "']").css('opacity', '1');
                    $(".drag[data-name='" + dataName + "']").attr('draggable', 'true');
                } else {
                    $(".drag[data-name='" + text + "']").css('opacity', '1');
                    $(".drag[data-name='" + text + "']").attr('draggable', 'true');
                }
            }

            $(this).on('click', function () {
                let text = $(this).find('span').text();
                let _idx = $(this).find('span').parents('.drop').index();
                let dataName = $(this).find('span').data('name');

                $(this).find('span').remove();
                // $(".drag[data-name='" + text + "']").css('opacity', '1');
                // $(".drag[data-name='" + text + "']").attr('draggable', 'true');

                $(this).removeClass('on')

                // if($(this).parents('.ui-drop-txt').hasClass('type02')) {
                //   $(".drag[data-name='" + dataName + "']").css('opacity', '1');
                //   $(".drag[data-name='" + dataName + "']").attr('draggable', 'true');
                // }
                if ($(this).parents('.ui-drop-txt').hasClass('type02')) {
                    $(".drag[data-name='" + dataName + "']").css('opacity', '1');
                    $(".drag[data-name='" + dataName + "']").attr('draggable', 'true');
                } else {
                    $(".drag[data-name='" + text + "']").css('opacity', '1');
                    $(".drag[data-name='" + text + "']").attr('draggable', 'true');
                }

            })
        }
    });

    //image type
    let img

    $('.ui-drag-img .drag').on({
        //드래그 시작시 요소 id 저장
        'dragstart': function (e) {
            $(this).css('border', '0');
            img = $(this).find('img');
            $(this).siblings('.drag').removeClass('active')
            $(this).addClass('active');
            $('img').removeClass('this')
            $(this).find('img').addClass('this');
        },
        //드래그 종료
        'dragend': function (e) {
            // let imgNum = $(this).parents('.page').find('.ui-drop-img .drop img').length;


            // if(num > 1) {
            //   console.log('1')
            //   // $(".drag[data-name='" + name + "']").css('opacity', '0.5');
            //   // $(".drag[data-name='" + name + "']").attr('draggable', 'false');
            // }
        }
    });

    $('.ui-drop-img .drop').on({
        'dragstart': function (e) {
            e.preventDefault();
        },
        'dragenter': function (e) {
            $(this).addClass('on');
        },
        //브라우저 표중 동작 취소
        'dragover': function (e) {
            e.preventDefault();
        },
        'drop': function (e) {
            $(this).prepend(img);
            e.preventDefault();
            let num = $(this).find('img').length;
            let name = $(this).find('span').text();

            if (num > 1) {

                img = $(this).find('img:first-child()').next('img');

                let _idx = $(this).find('img:first-child()').next('img').data('num');
                //$(this).find('img:first-child()').remove();

                img.remove();

                // $(this).parents('.page').find('.drag').eq(_idx).prepend(img);
                $(this).parents('.page').find('.ui-drag-img .drag').eq(_idx).prepend(img);
            }

            $(this).on('click', function () {
                let _idx = $(this).find('img').data('num')
                img = $(this).find('img');
                img.remove();

                $(this).parents('.page').find('.ui-drag-img .drag').eq(_idx).prepend(img);
                // $('.ui-drag-img .drag').eq(_idx).prepend(img);
            })
        }
    });

    //map
    $('svg g').on('click', function () {
        $(this).toggleClass('on');
    })

    //tab
    $('.tab-btn a').on('click', function () {
        let _this = $(this)
        let _idx = $(this).index();
        let _cnt = $(this).parent().next().children();

        $(this).siblings('a').removeClass('on');
        $(this).addClass('on');

        _cnt.removeClass('on');
        _cnt.eq(_idx).addClass('on');
    })

    //line
    let btn = $('.btn');
    let leftBtn = $('.left');
    let rightBtn = $('.right');
    let line = $('line')
    let x1, y1, x2, y2;


    leftBtn.on('click', function (e) {
        let _this = $(this);
        x1 = _this.position().left;
        y1 = _this.position().top + 10;

    })

    rightBtn.on('click', function (e) {
        let _this = $(this);
        let _idx = _this.index();

        x2 = _this.position().left - 20;
        y2 = _this.position().top + 10;
    })

    btn.on('click', function () {
        $(this).siblings('.btn').removeClass('active');
        $(this).toggleClass('active')

        if ($('.left.active').length == 1 && $('.right.active').length == 1) {
            $('svg').append('<line x1=' + x1 + ' y1=' + y1 + ' x2=' + x2 + ' y2=' + y2 + '></line>');
            $(".drawline-wrap").html($(".drawline-wrap").html());
            $('.left , .right').removeClass('active')
        }
    })

    $('body').on('click', 'line', function () {
        let _this = $(this);

        _this.remove();
    })


    //popup
    let popBtn = $('.pop-btn');
    let popCnt = $('.pop-memo');
    let closeBtn = $('.pop-close');
    let drawingBtn = $('.drawing-btn');
    let clearBtn = $('.clear-btn')
    let page = $('.swiper-pagination-bullet');
    let $canvas = $('.sketchpad');
    let context = $canvas[0].getContext('2d');

    function popOpen() {
        let _this = $(this);
        _this.toggleClass('active');

        if (_this.hasClass('active')) {
            popCnt.show();
        } else {
            popCnt.hide();
        }
    }

    function popClose() {
        popCnt.hide();
        popBtn.removeClass('active');
    }

    function canvasOpen() {
        let _this = $(this);
        //canvas2
        let color = $('#ECD13F');
        let lastEvent,
            mousedown = false;

        $canvas
            .mousedown(function (event) {

                lastEvent = event;
                mousedown = true;
            })
            .mousemove(function (event) {
                if (mousedown) {
                    // Draw lines
                    context.beginPath();
                    context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
                    context.lineTo(event.offsetX, event.offsetY);
                    context.strokeStyle = 'rgba(255,255,0)';
                    context.stroke();
                    context.lineWidth = 22;

                    lastEvent = event;
                }
            })
            .mouseup(function (event) {
                mousedown = false;
            })
            .mouseleave(function (event) {
                mousedown = false;
            });

        _this.toggleClass('active');

        if (_this.hasClass('active')) {
            clearBtn.show('slide', 400);
            $canvas.show();
            $('.sketchpad').removeClass('disabled');
        } else {
            clearBtn.hide('slide', 400);
            // $canvas.hide();
            $('.sketchpad').addClass('disabled');
        }

    }

    function canvasClear() {
        context.clearRect(0, 0, 1260, 1216);
    }

    function canvasIng() {
        if (drawingBtn.hasClass('active')) {
            let _this = $(this)
            let _idx = $(this).index();
            $canvas = $('.swiper-slide').eq(_idx).find('.sketchpad');
            context = $canvas[0].getContext('2d');
            // $('.swiper-slide').find($canvas).hide();
            $('.swiper-slide').eq(_idx).find($canvas).show();
        }
    }

    popBtn.on('click', popOpen)
    closeBtn.on('click', popClose)
    drawingBtn.on('click', canvasOpen)
    clearBtn.on('click', canvasClear)
    page.on('click', canvasIng)

    // canvas
    $(document).ready(function () {
        setAllStudentAnswer();
        var drawCanvas = document.getElementById('drawCanvas');
        var drawBackup = new Array();
        if (typeof drawCanvas.getContext == 'function') {
            var ctx = drawCanvas.getContext('2d');
            var isDraw = false;
            var width = $('#width').val();
            var color = $('#color').val();
            var pDraw = $('#drawCanvas').offset();
            var currP = null;

            $('#width').bind('change', function () {
                width = $('#width').val();
            });
            $('#color').bind('change', function () {
                color = $('#color').val();
            });

            // 저장된 이미지 호출
            if (localStorage['imgCanvas']) {
                loadImage();
            } else {
                ctx.clearRect(0, 0, drawCanvas.width, drawCanvas.height);
            }

            // Event (마우스)
            $('#drawCanvas').bind('mousedown', function (e) {
                if (e.button === 0) {
                    saveCanvas();
                    e.preventDefault();
                    ctx.beginPath();
                    isDraw = true;
                }
            });
            $('#drawCanvas').bind('mousemove', function (e) {
                var event = e.originalEvent;
                e.preventDefault();
                currP = {X: event.offsetX, Y: event.offsetY};
                if (isDraw) draw_line(currP);
            });
            $('#drawCanvas').bind('mouseup', function (e) {
                e.preventDefault();
                isDraw = false;
            });
            $('#drawCanvas').bind('mouseleave', function (e) {
                isDraw = false;
            });

            // Event (터치스크린)
            $('#drawCanvas').bind('touchstart', function (e) {
                saveCanvas();
                e.preventDefault();
                ctx.beginPath();
            });
            $('#drawCanvas').bind('touchmove', function (e) {
                var event = e.originalEvent;
                e.preventDefault();
                currP = {X: event.touches[0].pageX - pDraw.left, Y: event.touches[0].pageY - pDraw.top};
                draw_line(currP);
            });
            $('#drawCanvas').bind('touchend', function (e) {
                e.preventDefault();
            });

            // 선 그리기
            function draw_line(p) {
                ctx.lineWidth = width;
                ctx.lineCap = 'round';
                ctx.lineTo(p.X, p.Y);
                ctx.moveTo(p.X, p.Y);
                ctx.strokeStyle = color;
                ctx.stroke();
            }

            function loadImage() { // reload from localStorage
                var img = new Image();
                img.onload = function () {
                    ctx.drawImage(img, 0, 0);
                }
                img.src = localStorage.getItem('imgCanvas');
            }

            function clearCanvas() {
                ctx.clearRect(0, 0, drawCanvas.width, drawCanvas.height);
                ctx.beginPath();
                localStorage.removeItem('imgCanvas');
            }

            function saveCanvas() {
                drawBackup.push(ctx.getImageData(0, 0, drawCanvas.width, drawCanvas.height));
            }

            $('#btnClea').click(function () {
                clearCanvas();
            });

        }

        $('svg line').on('click', function () {
            $(this).remove();
        })
    });

    $('.page .question .text-box button').click(function () {
        $(this).toggleClass('active');
    });

    //s 220802 텍스트 박스 안 셀렉트 박스 active 제거
    $('.page .question .text-box button.selectBox').click(function () {
        $(this).removeClass('active');
    });
    //e 220802 텍스트 박스 안 셀렉트 박스 active 제거


    // design select
    $('.ui-select').each(function () {
        $(this).children('.selected').html($(this).children('.select-option-group').children('.select-option:first').html());

        $(this).attr('value', $(this).children('.select-option-group').children('.select-option:first').attr('value'));

        $(this).children('.selected,.select-arrow').click(function () {
            if ($(this).parent().children('.select-option-group').css('display') == 'none') {
                $(this).parent().children('.select-option-group').css('display', 'block');
            } else {
                $(this).parent().children('.select-option-group').css('display', 'none');
            }
        });

        $(this).find('.select-option').click(function () {
            $(this).parent().css('display', 'none');
            $(this).closest('.ui-select').attr('value', $(this).attr('value'));
            $(this).parent().siblings('.selected').html($(this).html());
        });
    });

    //select img
    $('button.selectBox').each(function () {
        $(this).children('span.selected').html($(this).children('span.selectOptions').children(
            'span.selectOption:first').html());
        $(this).attr('value', $(this).children('span.selectOptions').children('span.selectOption:first')
            .attr('value'));

        $(this).children('span.selected,span.selectArrow').click(function () {
            if ($(this).parent().children('span.selectOptions').css('display') == 'none') {
                $(this).parent().children('span.selectOptions').css('display', 'block');
            } else {
                $(this).parent().children('span.selectOptions').css('display', 'none');
            }
        });

        $(this).find('span.selectOption').click(function () {
            $(this).parent().css('display', 'none');
            $(this).closest('button.selectBox').attr('value', $(this).attr('value'));
            $(this).parent().siblings('span.selected').html($(this).html());
        });
    });


    $('select').on('click', function () {
        if (!$(this).hasClass('active')) {
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    })
    $('.selectBox').on('click', function () {
        if (!$(this).hasClass('active')) {
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    })

    function audioFn() {
        console.log('aaa')
    }
});

function setAllStudentAnswer() {
    const slides = document.querySelectorAll('.swiper-slide');
    slides.forEach((item, index) => {
        try {
            inputStudentAnswer({
                slide: item,
                index: index
            });
        } catch {
            console.log('convert json error');
        }
    });

    const maxLength = 200;

    var reg = /[\{\}\[\]\/;:|\)*~`^_+┼<>@\#$%&\\\(\=]/gi;

    $('input[type=text]').bind("keyup", function () {
        $(this).val($(this).val().replace(reg, ""));

        if ($(this).val().length > maxLength) {
            alert('글자 수 제한을 초과하였습니다.');
            $(this).val($(this).val().substring(0, maxLength));
        }
    })

    $('textarea').bind("keyup", function () {
        $(this).val($(this).val().replace(reg, ""));

        if ($(this).val().length > maxLength) {
            alert('글자 수 제한을 초과하였습니다.');
            $(this).val($(this).val().substring(0, maxLength));
        }
    })

    $('input[type=text]').attr("maxlength", maxLength);
    $('textarea').attr("maxlength", maxLength);

}
