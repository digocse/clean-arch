Feature: Map of Galleries
  As a user
  I want to open the map page
  To interact with the galleries markers displayed in the correct lat/lng coordinates

Scenario: User hasn't favorited profiles yet
  Given user hasn't favorited profiles
  When user opened the map page
  Then the page should display a map of markers for each gallery
  And display a carousel of all galleries with a random profile in the spotlight

Scenario: User has already favorited multiple profiles
  Given user has already favorited multiple profiles
  When user opened the map page
  Then the page should display a map of markers for each gallery
  And display a carousel of all galleries with a favorited profile in the spotlight
