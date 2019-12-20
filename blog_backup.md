Sinatra Portfolio Project
December 19, 2019
For my Sinatra portfolio project with learn.co, I was required to build a basic CRUD app which:

1)  Uses Sinatra to build the app

2)  Uses ActiveRecord for storing information in a database

3)  Includes more than one model class (e.g. User, Post, Category)

4)  Includes at least one has_many relationship on your User model (e.g. User has_many Posts)

5)  Includes at least one belongs_to relationship on another model (e.g. Post belongs_to User)

6)  Includes user accounts with unique login attribute (username or email)

7)  Ensures that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

8)  Ensures that users can't modify content created by other users

9)  Includes user input validations

10) BONUS - not required - Displays validation failures to user with error message (example form URL e.g.
     /posts/new)

11) My README.md includes a short description, install instructions, a contributors guide and a link to the license for my code



Confirm

- [x] I have a large number of small Git commits

- [x] My commit messages are meaningful

- [x] I made the changes in a commit that relate to the commit message

- [x] I don't include changes in a commit that aren't related to the commit message

I decided to build a Cornucopia stuffer, mainly because it’s something that I (and millions of others) would use every single day. In the Cornucopia Stuffer, a User can sign up for a new account, sign in, view existing cornucopias, and create new cornucopias. Any given user that is logged in can only edit or delete those thier cornucopias and/or the fantastic items stuffed in said cornucopias, which he or she created.

ActiveRecord

To begin with, I created a series of migrations using the ActiveRecord Migration module. Using this, I was able to persist data that related to the users of my site, and each of the types of objects (cornucopias/items) that users were able to create.

Multiple Models

Next, I created a series of classes to correspond with the tables in my database – User (which utilized has_secure_password), and the two classes of objects which a User could create: Cornucopias,  and Items.

Has_Many Relationship

In this case, User has_many Cornucopias, and has_many Items, through Cornucopias..

User Accounts

Before a user can log in and create/edit/delete a cornucopia, that user must first sign up for an account. To do this, a username and password is required. Once a registered user is logged in, that user can create any new cornucopia, but only edit/delete existing cornucopias and related items that he or she created.

Validation of User Input

When creating a user account, a username and password are all required – if a user tries to create an account and any of these fields is left blank, the user is redirected to the signup page and no user account is created. Similarly, if an individual tries to log in without the correct combination of username and password from a previously created account, that individual will be redirected to the login page. Likewise, when users attempt to create a cornucopia without providing a name for that cornucopia, they are sent back to the create page for that particular cornucopia or item to be stuffed in a cornucopia. In both of these cases, the user who doesn’t supply the required information will be given a flash message listing the requirements.

My code can be found at https://github.com/rstephens5911/cornucopia.

The idea for the Cornucopia Stuffer came from an Adult Swim bump from 2014.   

Adrenaline Rush is a song by the band Bushnut. It's known for playing at the end of multiple episodes of TNA's Impact Wrestling during their end show recap segment.

In 2014, Adult Swim used the song in a bump, with new lyrics. The lyrics involved stuffing a multitude of items into a cornucopia, from normal such as corn, to the entire Milky Way Galaxy, and also another Cornucopia.

original song: https://youtu.be/eJvswt8zsjo

the Adult Swim version (involving cornucopias): https://youtu.be/Q8hV7AK-jdo



Check it all out, then stuff some in the cornucopia!
