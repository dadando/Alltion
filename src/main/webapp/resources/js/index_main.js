'use strict';
$(function() {
    // 광고 없애기
    $(".ad__banner--closeBtn").click(function() {
        $(".ad__banner").hide();
    });
    
    // 인기 경매 - 카테고리 누를 때마다 이동
    /*
    $("ul.deadline-items__category > li").click(function() {
        let activeTab = $(this).attr('id');
        
        $('ul.deadline-items__category > li').removeClass('active');
        $('.deadline-items--product').removeClass('active');
        $(this).addClass('active');
        $('div.deadline-items--product.' + activeTab).addClass('active');
    })
    */
});