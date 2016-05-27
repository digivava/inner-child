——INNER CHILD——

Provides a suggestion combo for a kiddish video game, candy, and cartoon to enjoy, when you really just don't feel like doing boring grown-up stuff anymore.


MINIMUM VIABLE PROJECT:

A simple one-page app where you can type in a query and it will return the suggestion combo of video game, candy, and cartoon.

GOAL:
-To become more comfortable working with JSON data and writing tests, and to get a chance to finally practice with CSS and Bootstrap which I have been dying to play around with but never have enough time to do during our classroom projects.

TARGET AUDIENCE:
-Adults who don’t feel like adulting and just want to watch cartoons and eat candy and play games, like their inner child.

PERSONAL LEARNING GOALS:
-Bootstrap, which I’m interested in
-Communicating with external APIs and handling JSON data, which I’m meh at
-Testing, which I’m currently awful at

TECHNOLOGIES:
-Ruby on Rails
-JSON, HTTParty
-Minitest, VCR

SUCCESS MEANS:
-A fully-working web app that uses Bootstrap and doesn’t look like poop!
-SimpleCov coverage at 100%!! (or as close to it as possible)

If I haven’t already spent my allotted 15 hours on the project by that point, then I will spend the rest of the time adding user login functionality, and test coverage for that.


NOTES ON APIs:

—Video Games—
Giant Bomb video game database API:
http://www.giantbomb.com/api/documentation
-will probably use id, name, genres, image, original_game_rating (for filtering for games only with content rated “E”)
-has a search endpoint


—Candy—
Walmart open API
https://developer.walmartlabs.com/docs/read/Search_API

might use something better that contains candy if I can find it

—Cartoons—
API options:
http://www.guidebox.com/ maybe, not able to sort by animation, only by channel… would have to do cartoon network. but maybe can link to the actual video this way?

http://docs.videoservice.apiary.io/#reference/cartoon-network-app-methods/register-multiple-show-preferences/get-shows maybe this one? this is for cartoon network, can GET all available shows, not sure if it will work though



OPTIONAL FEATURES IF I HAVE TIME:
-Be able to sign up and log in as a user, just so I can practice with that more
-Asks user if they want chocolate or sour candy and filters results to only contain that kind of candy.
