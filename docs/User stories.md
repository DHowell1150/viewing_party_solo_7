# US1 Project Specs
1. Discover Movies: Search by Title

As a user,
When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
I should see
- a Button to Discover Top Rated Movies

- a text field to enter keyword(s) to search by movie title
- a Button to Search by Movie Title

Notes:

When the user clicks on the Top Rated Movies OR the search button, they should be taken to the  j page (more details of this on the 2. Movies Results Page story).

The movies will be retrieved by consuming The MovieDB API.

# US 2 
2. Movie Results Page

When I visit the discover movies page ('/users/:id/discover'),
and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
I should be taken to the movies results page (`users/:user_id/movies`) where I see: 

- Title (As a Link to the Movie Details page (see story #3))
- Vote Average of the movie

I should also see a button to return to the Discover Page.

Notes:

    There should only be a maximum of 20 results. The above details should be listed for each movie.

# US 3
3. Movie Details Page

As a user, 
When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`) where :id is a valid user id,
I should see
- a button to Create a Viewing Party
- a button to return to the Discover Page

I should also see the following information about the movie:

- Movie Title
- Vote Average of the movie
- Runtime in hours & minutes
- Genre(s) associated to movie
- Summary description
- List the first 10 cast members (characters & actress/actors)
- Count of total reviews
- Each review's author and information

Notes

    The above information should come from 3 different endpoints from The Movie DB API.
    The “Create a Viewing Party” button should take the user to the “New Viewing Party” page (/users/:user_id/movies/:movie_id/viewing_party/new) - see story #4.


# US 4

4. New Viewing Party Page

When I visit the new viewing party page ('/users/:user_id/movies/:movie_id/viewing_party/new', where :user_id is a valid user's id and :movie_id is a valid Movie id from the API),
I should see the name of the movie title rendered above a form with the following fields:

- Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
- When: field to select date
- Start Time: field to select time
- Guests: three (optional) text fields for guest email addresses 
- Button to create a party

Notes:

    When the party is created, the user should be redirected back to the dashboard where the new event is shown.
    The user who created the event should be designated the host. There should only ever be 1 host of the party. (Hint: check your schema.rb)
    The event should also be listed on any other existing user’s dashboards that were also invited to the party.
    Optionally, you can create a [custom validation](https://guides.rubyonrails.org/active_record_validations.html#custom-methods) to help with the duration attribute.
