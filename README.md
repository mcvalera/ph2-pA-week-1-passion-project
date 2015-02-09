P1) RESTful CRUD in MVC app with Sinatra / using AR / RESTful routes
    A user can create a new account -- form in index
    A user can read their profile -- see page
    A user can edit their profile -- see page
    A user can delete their profile -- button in edit page

    A user can add photos -- WHERE?
    A user can see all their photos -- show in specific album page
    A user can edit their photo info -- see page
    A user can delete a photo -- button in edit page

    A user can view all of their tags
    A user can add a tag to a photo

P2) AR many to many relationship
    A User has many photos, and many tags through photos.
    A Photo has many tags, and belongs to a User.
    A Tag belongs to a Photo, and has one User through Photo.

P3) User Login and Authentication

    A user can sign up for a new account with an email and password.
    An existing user can sign in
    If a user is not signed in, they only see a welcome message on the home page.
    If a user is signed in, they can see all users on the home page.
    A user can sign out using the provided delete route which is from a hidden field in the form.
    A helper method current_user returns the current signed in user and is used to display appropriate sign in / sign out portions of the view. (This logic is already implemented in the view - you just need to finish the helper method).

    Release 1: Encryption --- WORK ON THIS!

      Storing passwords is a serious business, and you should always take steps to keep that information secure. User passwords should be encrypted and stored in a password-hash field. You may implement this yourself or use the bcyrpt gem.

    Release 2: Validation (optional)

      Demonstrate model validation, error messages, and user access levels.

      Add validation to the user model including password length and appropriately formated email.
      Display appropriate error messages to the user for invalid data. Add a field to store user access level (Admin / Student) and limit functionality to different users leves. (ie an Admin can edit users but a Student can only see other users).

P4) HTML, CSS
    Potentially try to implement SASS (gem)

P5) AR validations, display validation errors in the view

    Add validations to the Event model and show appropriate messages to the user when the validations fail.

    Prevent Events from being saved when: a. The events date is empty, in the past, or is not valid. b. The events title is already taken or empty. c. The event organizers name is empty. d. The event organizers email address is invalid.

    Release 1 : Validations on UI (optional)

      An even better practice is to guide the users input to follow the format your program expects and/or make your program more flexible regarding the data it accepts from the user.

      Computers should serve people. Not the other way around.

      Modify the UI so a user is coerced into entering a valid date. Hint: Consider using a Datepicker.
      Modify the controller or model to be more flexible with the format of dates it accepts while still saving reasonable dates to the database. Hint: look into the rubygem Chronic.