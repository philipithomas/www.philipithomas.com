$("document").ready(function() {

    var sideResize = function() {
        $('.sidebar').width($('.sidebar').parent().width());
    }
    sideResize();
    // Add a listener on window reize
    $(window).resize(function() { sideResize() });
    
    var api = "https://api.philipithomas.com/data";

    var keyToName = {
        'twitterFollowers': 'Followers on <a href="http://twitter.com/philipithomas">Twitter</a>',
        'pageviewsDay': "Page Views, Last 24 Hours",
        'stepsThisWeek': 'Steps this week, via <a href="https://www.fitbit.com/user/282XN5">Fitbit</a>',
        'openLateMembers': 'Members of <a href="http://meetup.com/openlate">OpenLate Meetup</a>',
        'beers': 'Different <a href="http://beer.philipithomas.com">Beers Tried</a>'
    };
    var display;
    $.getJSON( api, function( data ) {
        $.each( data, function( key, val ) {
            display =  keyToName[key];
            $('#homebody').append('<tr><td class="align-right">' + val + '</td><td>' + display +'</td></tr>');
        });
    });
});

