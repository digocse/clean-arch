Feature: Map of Galleries
  As a user
  I want to open the map page
  To interact with the galleries markers displayed in the correct lat/lng coordinates

Scenario: User hasn't favorited stores yet
  Given user hasn't favorited stores
  When user opened the map page
  Then the page should display a map of markers for each gallery
  And display a carousel of all galleries with a random store in the spotlight

Scenario: User has already favorited multiple stores
  Given user has already favorited multiple stores
  When user opened the map page
  Then the page should display a map of markers for each gallery
  And display a carousel of all galleries with a favorited store in the spotlight
