# Culinary Course API Documentation
## Table of Contents
- [Introduction](#introduction)
- [Base URL](#base-url)
- [Authentication](#authentication)
- [API Functions](#api-functions)
- [End Points](#endpoints)
   1. [Login](#login)
   2. [User Management](#user-management)
   3. [Culinary Courses](#culinary-courses)
   4. [Recipe Categories](#recipe-categories)
   5. [Recipes](#recipes)
- [Conclusion](#conclusion)
## Introduction
-------------------------------------
Welcome to the Culinary Course API documentation. This API allows you to manage culinary courses, categories, and recipes. Users can interact with the API by creating an account, logging in, and performing various actions.
This is an on-demand culinary course that offers customers the flexibility to pay as per their convenience.

Contact email {vyshnavig28@gmail.com}
## Base URL
----------------------------------------------
https://app.swaggerhub.com/apis-docs/VYSHNAVIGU_1/CulinaryCourseAPI/9.9.9 
## Authentication
------------------------------------------------------
To access most endpoints of this API, you need to authenticate using JWT (JSON Web Tokens). You can obtain a token by logging in with your credentials.
## API Functions
-----------------------------------------------------

Ref   | Function                 | Description                                  | API End Point                                              | Request Type
------|--------------------------|----------------------------------------------|-----------------------------------------------------------|-------------
1.1   | Login                    | Authenticate and obtain an access token.    | /login                                                     | POST 
1.2   | Logout                   | Log out the currently authenticated user.  | /logout                                                    | POST 
2.1   | Create User              | Create a new user account.                  | /users                                                     | POST 
2.2   | Get User by Username    | Retrieve user details by username.         | /users/{username}                                         | GET 
2.3   | Update User              | Update user details.                        | /users/{username}                                         | PUT 
2.4   | Delete User              | Delete a user account.                      | /users/{username}                                         | DELETE 
3.1   | List All Courses         | Retrieve a list of available culinary courses. | /courses                                             | GET 
3.2   | Create Course            | Add a new culinary course.                 | /courses                                                   | POST 
3.3   | Get Course Details      | Retrieve the details of a specific culinary course. | /courses/{courseId}                                   | GET 
3.4   | Update Course            | Update the details of a specific culinary course. | /courses/{courseId}                                   | PUT 
3.5   | Delete Course            | Delete a specific culinary course.         | /courses/{courseId}                                       | DELETE 
4.1   | List Categories in a Course | Retrieve a list of categories within a specific culinary course. | /courses/{courseId}/categories                     | GET 
4.2   | Create Category          | Add a new category to a specific culinary course. | /courses/{courseId}/categories                             | POST 
4.3   | Delete Category          | Delete a specific category from a culinary course. | /courses/{courseId}/categories/{categoryId}           | DELETE 
5.1   | List Recipes in a Category | Retrieve a list of recipes within a specific category of a culinary course. | /courses/{courseId}/categories/{categoryId}/recipes | GET 
5.2   | Create Recipe            | Add a new recipe to a specific category of a culinary course. | /courses/{courseId}/categories/{categoryId}/recipes     | POST 
5.3   | Update Recipe            | Update the details of a specific recipe within a category of a culinary course. | /courses/{courseId}/categories/{categoryId}/recipes/{recipeId} | PUT 
5.4   | Delete Recipe            | Delete a specific recipe from a category of a culinary course. | /courses/{courseId}/categories/{categoryId}/recipes/{recipeId} | DELETE 

## Endpoints
---------------------------------------------------------------
### 1. Login
-------------------------------------------------------------
#### 1.1. Login

| End Point | Method | Description |
|-----------|--------|-------------|
| /login    | POST   | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities. |
##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username of the new user.|
| password   | string    | Password of the new user.|

- **Request:**
  ```json
  {
    "username": "your_username",
    "password": "your_password"
  }
- **Response:**
  ```json
  {
    "token": "your_access_token"
  }

#### 1.2. Logout

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /logout   | POST   | Log out the currently authenticated user. | Required (Bearer Token) |

### 2. User Management
----------------------------------------------------
Manage user accounts using the following endpoints:

#### 2.1. Create User

| End Point | Method | Description |
|-----------|--------|-------------|
| /users  | POST   | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities.|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username for the new user.|
| password   | string    | Password for the new user.|

- **Request:**
  ```json
  {
    "username": "new_user",
    "password": "new_password"
  }
- **Response:**
  ```json
  {
    "id": "user_id",
    "username": "new_user"
  }

#### 2.2. Get User by Username

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | GET   | Retrieves user details by their username. This function allows administrators or other users to view information about a specific user, such as their ID and username.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username for the user to retrieve their details.|

- **Response:**
  ```json
  {
    "id": "user_id",
    "username": "desired_username"
  }

#### 2.3. Update User

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | PUT   | Updates the password of an existing user account. This function enables users to change their passwords for security reasons or due to a forgotten password, providing them with the ability to maintain the security of their accounts.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| password   | string    | New password for the user.|

- **Request:**
  ```json
  {
    "password": "new_password"
  }
- **Response:**
  ```json
  {
    "id": "user_id",
    "username": "desired_username"
  }

#### 2.4. Delete User

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | DELETE   | Deletes a user account by their username. This function allows administrators to remove user accounts that are no longer needed or to handle account deletions requested by users, ensuring proper management of user data.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username of the user to be deleted.|

- **Response:** HTTP Status Code 204 (No Content)

### 3. Culinary Courses
--------------------------------------------------------------------
Manage culinary courses using the following endpoints:

#### 3.1. List All Courses

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses  | GET   | Retrieves a list of all available culinary courses. This function provides users with an overview of the courses offered on the platform, including their names, descriptions, and prices, allowing them to browse and select courses of interest.| Required (Bearer Token)|

- **Response:**
  ```json
  [
    {
      "courseId": "course_id",
      "name": "Baking",
      "description": "Includes Recipe Catogeries and Recipes of Baking",
      "price": 26.99
    },
    // Additional course objects
  ]

#### 3.2. Create Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses  | POST   | Adds a new culinary course with the specified name, description, and price. This function enables administrators to expand the catalog of available courses by creating new ones, providing users with more options to choose from.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| name       | string    | Name of the new course.|
| description| string    | Description of the new course.|
| price      | float     | Price of the new course.|

- **Request:**
  ```json
  {
    "name": "Meals for One",
    "description": "Includes Recipe Catogeries and Recipes that are specifically designed for one person",
    "price": 29.99
  }
- **Response:**
  ```json
  {
    "courseId": "new_course_id",
    "name": "Meals for One",
    "description": "Contains Recipe Catogeries and Recipes that are specifically designed for one person",
    "price": 29.99
  }

#### 3.3. Get Course Details

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}  | GET   | Retrieves details of a specific culinary course by its ID. This function allows users to view comprehensive information about a particular course, including its name, description, and price, helping them make informed decisions about enrollment.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|

- **Response:**
  ```json
  {
    "courseId": "course_id",
    "name": "Baking",
    "description": "Includes Recipe Catogeries and Recipes of Baking",
    "price": 26.99
  }
  
#### 3.4. Update Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}  | PUT   | Updates the details of an existing culinary course, including its name, description, and price. This function enables administrators to modify course information as needed, such as updating course content, adjusting pricing, or refining course descriptions.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course to update.|
| name       | string    | New name of the course.|
| description| string    | New description of the course.|
| price      | float     | New price for the course.|

- **Request:**
  ```json
  {
    "name": "Family Meals",
    "description": "Include Recipe Categories and Recipes required for a Family",
    "price": 24.99
  }
- **Response:**
  ```json
  {
    "CategoryId": "course_id",
    "name": "Grilling",
    "description": "Includes Recipe Categories and Recipes of Grilling",
    "price": 24.99
  }

#### 3.5. Delete Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}  | DELETE   | Deletes a culinary course by its ID. This function allows administrators to remove courses that are no longer offered or relevant, ensuring that the course catalog remains up-to-date and streamlined.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|

- **Response:** HTTP Status Code 204 (No Content)

### 4. Recipe Categories
----------------------------------------------------------------
Manage recipe categories within culinary courses using the following endpoints:

#### 4.1. List Categories in a Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories  | GET   | Retrieves a list of categories within a specific culinary course. This function provides users with an overview of the different recipe categories available within a course, allowing them to explore recipes based on their interests or preferences.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| categoryId   | string    | Unique identifier of the category.|

- **Response:**
  ```json
  [
    {
      "categoryId": "category_id",
      "name": "Baking"
    },
    // Additional category objects
  ]

#### 4.2. Create Category

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories  | POST   | Adds a new category to a specific culinary course. This function enables administrators to organize recipes into distinct categories, facilitating easier navigation and exploration for users looking for specific types of recipes.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| categoryId   | string    | Unique identifier of the category.|
| name       | string    | Name of the new category.|

- **Request:**
  ```json
  {
    "name": "Soups"
  }
- **Response:**
  ```json
  {
    "categoryId": "new_category_id",
    "name": "Soups"
  }

#### 4.3. Delete Category

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}  | DELETE   | Deletes a category from a culinary course. This function allows administrators to remove categories that are no longer needed or relevant, helping maintain a well-organized and efficient categorization system for recipes.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier of the category.|

- **Response:** HTTP Status Code 204 (No Content)

### 5. Recipes
---------------------------------------------------------
Manage recipes within recipe categories using the following endpoints:

#### 5.1. List Recipes in a Category

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes  | GET   | Retrieves a list of recipes within a specific category of a culinary course. This function provides users with access to a curated list of recipes belonging to a particular category, enabling them to discover and explore recipes tailored to their preferences.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier for the recipe category.|

- **Response:**
  ```json
  [
    {
     "recipeId": "recipe_id",
     "title": "Tomato Basil Soup",
     "ingredients": ["1 can (28 oz) whole peeled tomatoes", "1 small onion, chopped", "2 cloves garlic, minced", "2 cups 
       vegetable or chicken broth", "1/4 cup fresh basil leaves, chopped", "2 tablespoons olive oil", "Salt and pepper to 
       taste", "Optional: 1/4 cup heavy cream or coconut milk"],
     "instructions": "1. Heat olive oil in a large pot over medium heat. 2. Add chopped onion and minced garlic, sauté 
       until soft. 3. Add tomatoes (with juices) and broth, bring to a simmer. 4. Simmer for 15-20 minutes. 5. Blend until 
       smooth. 6. Stir in chopped basil. 7. Season with salt and pepper. 8. Stir in heavy cream or coconut milk if desired. 
       9. Warm through and serve hot.",
     "image_url": "https://example.com/tomato_basil_soup_image.jpg"
   },
    // Additional recipe objects
  ]

#### 5.2. Create Recipe

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes  | POST   | Adds a new recipe to a specific category of a culinary course. This function allows administrators to expand the recipe database by adding new recipes, providing users with a diverse selection of culinary creations to explore and try out.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier for the recipe category.|
| title      | string    | Title of the new recipe.|
| ingredients| array     | Ingredients required for the new recipe.|
| instructions| string   | Instructions to prepare the new recipe.|
| image_url  | string    | URL of the image associated with the new recipe.|

- **Request:**
  ```json
  {
    "title": "Egg Bites",
    "ingredients":  ["4 large eggs", "1/2 cup milk", "1/2 cup shredded cheese (such as cheddar or mozzarella)", "1/4 cup 
      diced ham or cooked bacon", "Salt and pepper to taste", "Cooking spray or butter for greasing muffin tin"],
    "instructions": "1. Preheat your oven to 350°F (175°C) and grease a muffin tin with cooking spray or butter. 2. In a 
      mixing bowl, whisk together eggs and milk until well combined. 3. Stir in shredded cheese, diced ham or cooked bacon, 
      salt, and pepper. 4. Pour the egg mixture into the prepared muffin tin, filling each cup about 3/4 full. 5. Bake in 
      the preheated oven for 20-25 minutes, or until the egg bites are set and slightly golden on top. 6. Remove from the 
      oven and let cool for a few minutes before serving. 7. Serve warm and enjoy!",
    "image_url": "https://example.com/egg_bites_image.jpg"
  }
- **Response:**
  ```json
  {
    "recipeId": "new_recipe_id",
     "title": "Egg Bites",
    "ingredients":  ["4 large eggs", "1/2 cup milk", "1/2 cup shredded cheese (such as cheddar or mozzarella)", "1/4 cup 
      diced ham or cooked bacon", "Salt and pepper to taste", "Cooking spray or butter for greasing muffin tin"],
    "instructions": "1. Preheat your oven to 350°F (175°C) and grease a muffin tin with cooking spray or butter. 2. In a 
      mixing bowl, whisk together eggs and milk until well combined. 3. Stir in shredded cheese, diced ham or cooked bacon, 
      salt, and pepper. 4. Pour the egg mixture into the prepared muffin tin, filling each cup about 3/4 full. 5. Bake in 
      the preheated oven for 20-25 minutes, or until the egg bites are set and slightly golden on top. 6. Remove from the 
      oven and let cool for a few minutes before serving. 7. Serve warm and enjoy!",
    "image_url": "https://example.com/egg_bites_image.jpg"
  }

#### 5.3. Update Recipe

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}  | PUT   | Updates the details of an existing recipe within a category of a culinary course. This function enables administrators to modify recipe information, such as updating recipe titles, ingredients, instructions, or associated images, ensuring accurate and up-to-date recipe content.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier for the recipe category.|
| recipeId   | string    | Unique identifier for the recipe to update.|
| title      | string    | New title for the recipe.|
| ingredients| array     | New ingredients for the recipe.|
| instructions| string   | New instructions for the recipe.|
| image_url  | string    | New URL of the image associated with the recipe.|

- **Request:**
  ```json
  {
    "title": "Egg Bites",
    "ingredients":  ["4 large eggs", "1/2 cup milk", "1/2 cup shredded cheese (such as cheddar or mozzarella)", "1/4 cup 
      diced ham or cooked bacon", "Salt and pepper to taste", "Cooking spray or butter for greasing muffin tin"],
    "instructions": "1. Preheat your oven to 350°F (175°C) and grease a muffin tin with cooking spray or butter. 2. In a 
      mixing bowl, whisk together eggs and milk until well combined. 3. Stir in shredded cheese, diced ham or cooked bacon, 
      salt, and pepper. 4. Pour the egg mixture into the prepared muffin tin, filling each cup about 3/4 full. 5. Bake in 
      the preheated oven for 20-25 minutes, or until the egg bites are set and slightly golden on top. 6. Remove from the 
      oven and let cool for a few minutes before serving. 7. Serve warm and enjoy!",
    "image_url": "https://example.com/egg_bites_image.jpg"
  }
- **Response:**
  ```json
  {
    "recipeId": "recipe_id",
    "title": "Omelette",
    "ingredients": [
      "2 large eggs",
      "1/4 cup milk",
      "1/4 cup shredded cheese (such as cheddar or Swiss)",
      "1/4 cup diced vegetables (such as bell peppers, onions, and tomatoes)",
      "Salt and pepper to taste",
      "1 tablespoon butter or oil for cooking"
    ],
    "instructions": "1. In a mixing bowl, beat the eggs and milk until well combined. Season with salt and pepper. 2. Heat 
     the butter or oil in a non-stick skillet over medium heat. 3. Pour the egg mixture into the skillet. 4. As the eggs 
     start to set around the edges, use a spatula to gently lift them, allowing the uncooked eggs to flow underneath. 5. 
     When the omelette is mostly set but still slightly runny on top, sprinkle the shredded cheese and diced vegetables 
     over one half of the omelette. 6. Carefully fold the other half of the omelette over the filling. 7. Cook for another 
     minute or until the cheese is melted and the omelette is cooked through. 8. Slide the omelette onto a plate and serve 
    immediately.",
  "image_url": "https://example.com/omelette_image.jpg"
  }

#### 5.4. Delete Recipe

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}  | DELETE   | Deletes a recipe from a category of a culinary course. This function allows administrators to remove recipes that are no longer needed or relevant, ensuring that the recipe database remains well-curated and free from outdated or redundant entries.| Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier for the recipe category.|
| recipeId   | string    | Unique identifier for the recipe to update.|

- **Response:** HTTP Status Code 204 (No Content)
## Conclusion
The API follows a RESTful architecture, with clear and consistent endpoint naming conventions and request/response structures. Input fields for each function are well-defined, ensuring data integrity and consistency throughout interactions with the API. Similarly, output fields provide comprehensive information, allowing users to easily consume and utilize the data returned by API requests.
Overall, the Culinary Course API provides a robust platform for culinary education and recipe management, empowering developers to build innovative applications and services in the culinary domain.
