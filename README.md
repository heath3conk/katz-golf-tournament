# Christopher Katzenstein Charity Golf Tournament
*A Ruby on Rails website designed to allow participants to signup with players, diners or sponsors for the charity golf tournament as well as to enable the event organizer to view and modify those signup records.*

**Creating a signup.**
I've used nested forms to create both a `Signup` object and one of the signup-type objects: `Sponsorship`, `Player`, or `Diner`. A signup may have a single sponsorship; a signup may have more than one player or diner. 

After completing the signup form, a participant views the details of the signup and may update the signup or confirm. Once the participant has completed the signup, they're directed to the contact information for the event organizers so they'll know where to mail their donation. I've made no provisions for participants to log in to the website to see or change their signups - once they've successfully signed up, they're done.

**Organizer login.**
I decided to make the login mechanism unobtrusive, making a link to that page of the "Proceeds..." line in the footer. The organizer can register a new user by clicking on the "Federal Tax ID..." line in the footer and entering the required `role` in the form. Anyone who attempts to register a new user without the correct `role` or to login with invalid credentials gets a generic error message.

**Testing.**
I've written model tests for the methods I created in the `Signup` and `Sponsorship` models (none of the other models have methods). Aside from a couple that are incidental to the model tests, I haven't written tests that cover ActiveRecord associations, trusting that ActiveRecord knows what it's doing. 

I am currently working on controller tests.
