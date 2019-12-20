# cornucopia
create your own cornucopia, then see what you can put in it!

## Usage
To use this app, just clone, run `rake db:migrate` and then run `shotgun`.

### Progress
#### 11/30/2019
  set up project on github and cloned repo down to Learn ide to get started.  spec.md loaded as per  
  instructions.
#### 12/01/2019
  files today: app/controllers  config.ru  Rakefile   Gemfile established framework for controllers.  
  Reviewed MVC ideas and got the idea of MVC relations concerning  multiple models/controllers/views  
  figured out, I think.
#### 12/02/2019
  files today: application_controller completed(maybe). Models built. Views spaceholders laid out.  
  /index stubbed. layout.erb written. No testing today - I still need to build tables and database.
#### 12/05/2019  
  today's issue was migrating the tables.  I couldn't get rake db:migrate to work today.  I added a  
  database.yml file to the config file and chased down some typos. Finally, the migration worked!  
  I went through every file today and rebuilt several files.
#### 12/08/2019
  rebuilt framework using corneal gem.  Too many issues with db.
#### 12/09/2019
  finished coding the project.  now it's testing, fixing typos, and working on the css to make it  
  look pretty.
#### 12/12/2019
  after a couple busy days, progress was made this evening.  Background image was added,  
  pilgrim image added to layout and debugged.  Some navigation in the CRUD MVC was  
  established.
#### 12/14/2019
  worked on css today.  Started work on a nav bar via the layout page and styling through css.  
  Cleaned up links in the flow of the pages and debugged lots of messes. Links still need  
  debugging and verification. Session control and user actions need to still be verified - I  
  need to make sure that only the allowed user can manipulate there data.
#### 12/17/2019
  refactored entire site today.  Too many issues, too many bugs, too many everything.  More css work  
  added solid background in some needed places.  Made the crud links on the welcome page - initially  
  there for reference - working links one a user has logged in by creating a copy "/index" page.
#### 12/18/2019
  kept it dry today. well, made it dry...the get '/' page and get '/index' page were the same pages  
  (yesterday's   notes) only difference was, the index page had dynamic links based on the user's id.  
  The '/' "Welcome" page had generic, inactive links that I had originally placed there as reference  
  points, later placeholders.  Today, I made the Apllication Controller check if a user is logged in,  
  then utilized the erb portion of this project to dynamically render the links for the logged in user.  
  keeping it dry! I also added flash messages throughout the site for posts, updates and deletions,  
  because it is new to me.
#### 12/19/2019
  created the blog: `https://bluemorpho.cc/f/sinatra-portfolio-project` today.  Tried to test all  
  controllers today and check functionality of each.  Layout and format look good.  I will do the  
  walkthrough video tomorrow - probably without naration since my hearing has gotten so bad, i can't  
  hear myself speak most of the time.
