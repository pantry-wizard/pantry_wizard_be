<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]




<br />
<div align="center">
  <a href="https://github.com/pantry-wizard/pantry_wizard_be">
    <img src="https://user-images.githubusercontent.com/117066950/231888243-b836b725-b848-4151-a449-6564fd7d4e5e.png" alt="Logo" width="582" height="404">
  </a>

<h3 align="center">Pantry Wizard</h3>

  <p align="center">
    An application that allows a user to create meal plans based on their Dietary Restrictions, Intolerances, and Cusine Preferences. 
    <br>
    This is the backend service of the application.
    <br />
    <!-- <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
    <!-- <a href="https://github.com/github_username/repo_name">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Report Bug</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Request Feature</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_fe">Front End Repo</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
      </ul>
    </li>
    <li><a href="#available-endpoints">Available Endpoints</a></li>
    <li><a href="#goals">Goals</a></li>
    <!-- <li><a href="#usage">Usage</a></li> -->
    <!-- <li><a href="#roadmap">Roadmap</a></li> -->
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <!-- <li><a href="#contact">Contact</a></li> -->
    <!-- <li><a href="#acknowledgments">Acknowledgments</a></li> -->
  </ol>
</details>


<br>

<!-- ABOUT THE PROJECT -->
## About The Project
<br>

At Pantry Wizard, we believe that everyone deserves access to healthy, delicious food. We're on a mission to reduce food waste and alleviate food insecurity by providing personalized meal planning that simplifies the decision-making process and empowers individuals to take control of their nutrition. Our app is designed to meet the needs of neurodivergent individuals, picky eaters, and anyone facing time or resource constraints, so they can focus on what really matters in their lives. Join us in making a positive impact on our communities, one meal at a time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With:

* [![Ruby]][Ruby-url] **3.1.1**
* [![Rails]][Rails-url] **7.0.4**
* [![Postgresql]][Postgresql-url]
* [![Heroku]][Heroku-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is a Ruby on Rails application which establishes API endpoints to be called in the <a href="https://github.com/pantry-wizard/pantry_wizard_fe"> `pantry_wizard_fe` </a> repository. To run the application locally, both front-end and back-end repositories will need to be cloned and set up fully with required gems and environment variables.

<br>

### Installation

1. Clone the repo:
   ```bash
   git clone git@github.com:pantry-wizard/pantry_wizard_be.git
   ```

2. Install gems:
   ```bash
   bundle install
   ```

3. To establish the database, run:
   ```bash
   rails db:create
   ```

4. Since this is the back-end repository, a database migration is also necessary, run:
   ```bash
   rails db:migrate
   ```
<br>

  Inspect the `/db/schema.rb` and compare to the 'Schema' section below to ensure this migration has been done successfully.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


### Testing with RSpec

Once `pantry_wizard_be` is correctly installed, run tests locally to ensure the repository works as intended.

<br>

  To test the entire RSpec suite, run:
   ```bash
   bundle exec rspec
   ```

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Here</a>. We will issue an update/fix as soon as possible!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## Available Endpoints
- This API can be called locally using a program like [Postman](https://www.postman.com).

- *Note:* Necessary parameters marked with {}

<br>

### __User__ __Endpoints__

<br>
### 1. Create a New User
<br>

*Note:* pass `name`, `google_id`, & `email` in request body


```bash
POST '/api/v1/users'
```

   
Response:
```bash
{
  "data":
  {
    "id":"USER_ID",
    "type":"user",
    "attributes":
    {
      "name":"USER_NAME",
      "email":"USER_EMAIL",
      "google_id":"USER_GOOGLE_ID"
    }
  }
}
```
### 2. Return All Users
<br>

```bash 
GET '/api/v1/users'
```

Response: 
```bash
{
    "data": [
        {
            "id": "USER_ID",
            "type": "user",
            "attributes": {
                "email": "EMAIL",
                "name": "NAME",
                "google_id": "GOOGLE_ID",
                "id": "USER_ID",
                "intolerances": "INTOLERANCES",
                "likes": "LIKES",
                "dislikes": "DISLIKES",
                "dietary_restrictions": "DIETARY RESTRICTIONS"
            }
        }
    ]
}
```

### 3. Return a Specific User
<br>

```bash 
GET 'api/v1/users/{google_id}
```

Response: 
```bash
{
    "data": [
        {
            "id": "USER_ID",
            "type": "user",
            "attributes": {
                "email": "EMAIL",
                "name": "NAME",
                "google_id": "GOOGLE_ID",
                "id": "USER_ID",
                "intolerances": "INTOLERANCES",
                "likes": "LIKES",
                "dislikes": "DISLIKES",
                "dietary_restrictions": "DIETARY RESTRICTIONS"
            }
        }
    ]
}
```

### 4. Update a User 
<br>

*Note:* pass updated attributes in request body

```bash 
PATCH 'api/v1/users/{google_id}
```

Response: 
```bash
{
    "data": [
        {
            "id": "USER_ID",
            "type": "user",
            "attributes": {
                "email": "EMAIL",
                "name": "NAME",
                "google_id": "GOOGLE_ID",
                "id": "USER_ID",
                "intolerances": "INTOLERANCES",
                "likes": "LIKES",
                "dislikes": "DISLIKES",
                "dietary_restrictions": "DIETARY RESTRICTIONS"
            }
        }
    ]
}
```

### 5. Delete a User
<br>

```bash 
DELETE 'api/v1/users/{google_id}'
```
<br>
<br>

## __Day__ __Plan__ __Endpoints__ 
<br>
### 1. Get Day Plans for a User
<br>

```bash 
GET 'api/vi/users/{google_id}/day_plans
```

Response:

```bash 
{
    "data": [
        {
            "id": "ID",
            "type": "day_plan",
            "attributes": {
                "user_id": "USER_ID",
                "date": "DATE",
                "recipes": [
                    {
                        "id": "RECIPE_ID",
                        "spoonacular_id": "SPOONACULAR_ID",
                        "name": "RECIPE_NAME",
                        "ingredients": "RECIPE INGREDIENTS",
                        "instructions": "RECIPE INSTRUCTIONS",
                        "image": "RECIPE IMAGE",
                        "created_at": "CREATED_AT",
                        "updated_at": "UPDATED_AT"
                    }
                ]
            }
        }
    ]
}
```

### 2. Get a Specific Day Plan for a User
<br>

```bash 
GET 'api/v1/users/{user_id}/day_plans/{day_plan_id}'
```

Response: 
```bash 
{
    "data": [
        {
            "id": "ID",
            "type": "day_plan",
            "attributes": {
                "user_id": "USER_ID",
                "date": "DATE",
                "recipes": [
                    {
                        "id": "RECIPE_ID",
                        "spoonacular_id": "SPOONACULAR_ID",
                        "name": "RECIPE_NAME",
                        "ingredients": "RECIPE INGREDIENTS",
                        "instructions": "RECIPE INSTRUCTIONS",
                        "image": "RECIPE IMAGE",
                        "created_at": "CREATED_AT",
                        "updated_at": "UPDATED_AT"
                    }
                ]
            }
        }
    ]
}
```

### 3. Create a Day Plan for a User
<br>

```bash
Post '/api/v1/users/{user_id}/day_plans
```

Response: 
```bash 
{
    "data": [
        {
            "id": "ID",
            "type": "day_plan",
            "attributes": {
                "user_id": "USER_ID",
                "date": "DATE",
                "recipes": [
                    {
                        "id": "RECIPE_ID",
                        "spoonacular_id": "SPOONACULAR_ID",
                        "name": "RECIPE_NAME",
                        "ingredients": "RECIPE INGREDIENTS",
                        "instructions": "RECIPE INSTRUCTIONS",
                        "image": "RECIPE IMAGE",
                        "created_at": "CREATED_AT",
                        "updated_at": "UPDATED_AT"
                    }
                ]
            }
        }
    ]
}
```

### 4. Update a Day Plan for a User
<br>

*Note:* pass updated attributes in request body

```bash
PATCH '/api/v1/users/{user_id}/day_plans/{day_plan_id}'
```
Response: 
```bash 
{
    "data": [
        {
            "id": "ID",
            "type": "day_plan",
            "attributes": {
                "user_id": "USER_ID",
                "date": "DATE",
                "recipes": [
                    {
                        "id": "RECIPE_ID",
                        "spoonacular_id": "SPOONACULAR_ID",
                        "name": "RECIPE_NAME",
                        "ingredients": "RECIPE INGREDIENTS",
                        "instructions": "RECIPE INSTRUCTIONS",
                        "image": "RECIPE IMAGE",
                        "created_at": "CREATED_AT",
                        "updated_at": "UPDATED_AT"
                    }
                ]
            }
        }
    ]
}
```
### 5. Delete a Day Plan for a User
<br>

```bash
DELETE '/api/v1/users/{user_id}/day_plans/{day_plan_id}
```
<br>
<br>

## __Recipe__ __End__ __Points__
<br>

### 1. Get All Recipes
<br>

```bash 
GET '/api/v1/recipes
```
Response:
```bash
{
    "data": [
        {
            "id": "1",
            "type": "recipe",
            "attributes": {
                "spoonacular_id": "SPOONACULAR_ID",
                "name": "RECIPE_NAME",
                "ingredients": "RECIPE_INGREDIENTS",
                "instructions": "RECIPE_INSTRUCTIONS",
                "image": "RECIPE_IMAGE"
        }
    ]
}
```

### 2. Create a Recipe
<br>

```bash 
Post '/api/v1/recipes'
```
Response:

```bash
{
    "data": [
        {
            "id": "1",
            "type": "recipe",
            "attributes": {
                "spoonacular_id": "SPOONACULAR_ID",
                "name": "RECIPE_NAME",
                "ingredients": "RECIPE_INGREDIENTS",
                "instructions": "RECIPE_INSTRUCTIONS",
                "image": "RECIPE_IMAGE"
        }
    ]
}
```

### 3. Add a Recipe to a Day Plan
<br>

*Note:* You must pass in a day plan id and recipe id as params(params: { day_plan_id: @day_plan.id, recipe_id: @recipe_1.id })

```bash
Post '/api/v1/day_plan_recipes
```

Response: 
```bash 
{
    "data": {
        "id": "6",
        "type": "day_plan_recipe",
        "attributes": {
            "day_plan_id": "DAY_PLAN_ID"
            "recipe_id": "RECIPE_ID"
        }
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Goals

Pantry Wizard was crafted to satisfy the requirements for The Turing Back-End Mod 3 group project, **Consultancy**. 

See the official project requirements [here](https://backend.turing.edu/module3/projects/consultancy/).

<br>

### Learning Goals
- Impliment Google OAuth so users can log in easily.
- Impliment CircleCI for continuous integration.
- Utilize Service Oriented Architecture by creating an API with Rails.
- Interact with two unique external API's.
- Deploy both the frontend and backend on Heroku.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Future Goals
- Add google calendar so meals can be scheduled in advance.
- Integrating Swagger.
- Integrating HoneyBadger for observability of backend queries.
- Integrating Swagger to make endpoint testing easier.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Database Schema

<img src="https://user-images.githubusercontent.com/117066950/231925266-0c94620d-a411-4649-a073-e09622d44edf.png">

<br>

## Contributors
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/116330317?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/88596340?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104170346?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/71752551?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Chris Crane</td>
    <td>Conner Van Loan</td>
    <td>Caleb Thomas</td>
    <td>Brian Hayes</td>
    <td>Dawson Timmons</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/GreenGogh47">GitHub</a><br>
      <a href="https://www.linkedin.com/in/chris-crane-16106814/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/C-V-L">GitHub</a><br>
      <a href="https://www.linkedin.com/in/conner-van-loan/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/cjthomas00">GitHub</a><br>
      <a href="https://www.linkedin.com/in/calebjthomas/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Bphayes1200">GitHub</a><br>
      <a href="https://www.linkedin.com/in/brian-hayes-363812204/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/DMTimmons1">GitHub</a><br>
      <a href="https://www.linkedin.com/in/dawson-timmons/">LinkedIn</a>
    </td>
  </tr>
</table>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[contributors-url]: https://github.com/pantry-wizard/pantry_wizard_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[forks-url]: https://github.com/pantry-wizard/pantry_wizard_be/network/members
[stars-shield]: https://img.shields.io/github/stars/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[stars-url]: https://github.com/pantry-wizard/pantry_wizard_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[issues-url]: https://github.com/pantry-wizard/pantry_wizard_be/issues
[license-shield]: https://img.shields.io/github/license/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[license-url]: https://github.com/pantry-wizard/pantry_wizard_be/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red
[Rails-url]: https://rubyonrails.org/
[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/