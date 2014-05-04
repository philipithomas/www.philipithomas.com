$("document").ready(function() {
    var api = "https://api.philipithomas.com/data";

    var keyToName = {
        'twitterFollowers': {
          'pre': '',
          'post': 'people follow me on <a href="http://twitter.com/philipithomas">Twitter</a>',
        },
        'pageviewsDay': {
          'pre': '',
          'post': "times people accessed my website in the last 24 Hours",
        }, 
        'stepsThisWeek': {
          'pre': 'I took',
          'post': 'steps this week with <a href="https://www.fitbit.com/user/282XN5">Fitbit</a>',
        },
        'openLateMembers': {
          'pre': '',
          'post': 'people are in the <a href="http://meetup.com/openlate">OpenLate Meetup</a>',
        },
        'beers': {
          'pre': 'I have tried',
          'post': 'different <a href="http://beer.philipithomas.com">beers</a>',
        },
    };
    var display;
    $.getJSON( api, function( data ) {
        $.each( data, function( key, val ) {
            display =  keyToName[key];
            $('#homebody').append('<li>' + display.pre + ' ' + val + ' ' + display.post + '</li>');
        });
    });
});

