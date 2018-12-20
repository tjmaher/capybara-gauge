# Authorization: Validate logging into and out of The-Internet

* LOGIN: Visit the Login Page
* LOGIN: Verify heading: "Login Page"

## Authorization: Successfully log into and out of the secure area
* LOGIN: Log into the site using username and password: "tomsmith" and "SuperSecretPassword!"
* SECURE AREA: Verify heading: "Secure Area"
* SECURE AREA: Log out of the secure area
* LOGIN: Verify heading: "Login Page"

## Authorization: Verify alert error is shown when entering a blank user name and password.
* LOGIN: Log into the site using username and password: " " and " "
* LOGIN: Verify alert message: "Your username is invalid"
