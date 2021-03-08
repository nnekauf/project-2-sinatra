# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    - ActiveRecord is in use
- [x] Include more than one model class (e.g. User, Post, Category)
    - Includes Outfit and User models
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - Users have many Outfits
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Outfits belong to a User
- [x] Include user accounts with unique login attribute (username or email)
    - All Users validates uniquness of username
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - All Outfits have all CRUD capabilities
- [x] Ensure that users can't modify content created by other users
    - Users can not view the modification funtionality on the page nor navigate to it in the browser if they do not own the Outfit
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - README.md is available and meets requirements

Confirm
- [x] You have a large number of small Git commits
    - Commits have been made with each defining task
- [x] Your commit messages are meaningful
    - Commit messages explain what was changed 
- [x] You made the changes in a commit that relate to the commit message
    - Commit messages reflect to what was done
- [x] You don't include changes in a commit that aren't related to the commit message
    - All commits describe what was done


