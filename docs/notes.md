# Docs:
- V3
- limit 50request/second
- basic authentication: 

`curl --request GET \
     --url 'https://api.themoviedb.org/3/movie/11?api_key=API_KEY'`




Endpoints needed:

3. "/3/movie/{movie_id}"
- genre
{
  "id": 18,
  "name": "Drama"
},
- runtime
142

4. "/3/review/{review_id}"
- reviews count
- reviewer_author- author_details
- content
    {
      "author": "elshaarawy",
      "author_details": {
        "name": "",
        "username": "elshaarawy",
        "avatar_path": null,
        "rating": 9
      },
      "content": "very good movie 9.5/10 محمد الشعراوى",
      "created_at": "2016-04-29T18:08:41.892Z",
      "id": "5723a329c3a3682e720005db",
      "updated_at": "2021-06-23T15:57:47.190Z",
      "url": "https://www.themoviedb.org/review/5723a329c3a3682e720005db"
    },


5. "/3/movie/{movie_id}/credits"
    "cast": [
    {
      "adult": false,
      "gender": 2,
      "id": 504,
      "known_for_department": "Acting",
      "name": "Tim Robbins",
      "original_name": "Tim Robbins",
      "popularity": 18.195,
      "profile_path": "/djLVFETFTvPyVUdrd7aLVykobof.jpg",
      "cast_id": 3,
      "character": "Andy Dufresne",
      "credit_id": "52fe4231c3a36847f800b131",
      "order": 0
    }



## endpoint for credits
- 


## endpoint for reviews:
- /3/review/{review_id}
- 

## endpoint for genre
- /3/genre/movie/list

- {
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    },
    {
      "id": 16,
      "name": "Animation"
    },
    {
      "id": 35,
      "name": "Comedy"
    },
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 99,
      "name": "Documentary"
    },
    {
      "id": 18,
      "name": "Drama"
    },
    {
      "id": 10751,
      "name": "Family"
    },
    {
      "id": 14,
      "name": "Fantasy"
    },
    {
      "id": 36,
      "name": "History"
    },
    {
      "id": 27,
      "name": "Horror"
    },
    {
      "id": 10402,
      "name": "Music"
    },
    {
      "id": 9648,
      "name": "Mystery"
    },
    {
      "id": 10749,
      "name": "Romance"
    },
    {
      "id": 878,
      "name": "Science Fiction"
    },
    {
      "id": 10770,
      "name": "TV Movie"
    },
    {
      "id": 53,
      "name": "Thriller"
    },
    {
      "id": 10752,
      "name": "War"
    },
    {
      "id": 37,
      "name": "Western"
    }
  ]
}