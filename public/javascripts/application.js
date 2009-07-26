$(document).ready(function () {
    $('#supporter_pledged_public_support').click( function() {
        if($(this).attr('checked')) {
            $('#public_pledge_information').blindDown();
        } else {
            $('#public_pledge_information').blindUp();
        }
    });
});
