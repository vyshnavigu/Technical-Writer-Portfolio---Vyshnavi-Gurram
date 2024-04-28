# Culinary Course API Documentation

## Table of Contents
- [Introduction](#introduction)
- [Base URL](#base-url)
- [Authentication](#authentication)
- [API Functions](#api-functions)
- [Endpoints](#endpoints)
    - [Login](#1-login)
    - [User Management](#2-user-management)
    - [Culinary Courses](#3-culinary-courses)
    - [Recipe Categories](#4-recipe-categories)
    - [Recipes](#5-recipes)
- [Conclusion](#conclusion)

## Introduction
-------------------------------------
Welcome to the Culinary Course API documentation. This API allows you to manage culinary courses, categories, and recipes. Users can interact with the API by creating an account, logging in, and performing various actions. This is an on-demand culinary course that offers customers the flexibility to pay as per their convenience.

Contact email {vyshnavig28@gmail.com}

## Base URL
----------------------------------------------
[https://app.swaggerhub.com/apis-docs/VYSHNAVIGU_1/CulinaryCourseAPI/9.9.9](https://app.swaggerhub.com/apis-docs/VYSHNAVIGU_1/CulinaryCourseAPI/9.9.9)

## Authentication
------------------------------------------------------
To access most endpoints of this API, you need to authenticate using JWT (JSON Web Tokens). You can obtain a token by logging in with your credentials.

## API Functions
-----------------------------------------------------

| Ref | Function | API End Point | Request Type | Description |
|-----|----------|---------------|--------------|--------------|
| [1.1](#11-login)| Login  | /login | POST | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities. |
| [1.2](#12-logout)| Logout | /logout | POST | Log out the currently authenticated user.  |
| [2.1](#21-create-user)| Create User | /users | POST | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities. |
| [2.2](#22-get-user-by-username)| Get User by Username | /users/{username} | GET | Retrieves user details by their username. This function allows administrators or other users to view information about a specific user, such as their ID and username. |
| [2.3](#23-update-user)| Update User| /users/{username} | PUT | Update user details. Updates the password of an existing user account. This function enables users to change their passwords for security reasons or due to a forgotten password, providing them with the ability to maintain the security of their accounts. |
| [2.4](#24-delete-user)| Delete User | /users/{username} | DELETE | Deletes a user account by their username. This function allows administrators to remove user accounts that are no longer needed or to handle account deletions requested by users, ensuring proper management of user data. |
| [3.1](#31-list-all-courses)| List All Courses | /courses | GET | Retrieves a list of all available culinary courses. This function provides users with an overview of the courses offered on the platform, including their names, descriptions, and prices, allowing them to browse and select courses of interest. |
| [3.2](#32-create-course)| Create Course | /courses | POST | Adds a new culinary course with the specified name, description, and price. This function enables administrators to expand the catalog of available courses by creating new ones, providing users with more options to choose from. |
| [3.3](#33-get-course-details)| Get Course Details | /courses/{courseId} | GET | Retrieves details of a specific culinary course by its ID. This function allows users to view comprehensive information about a particular course, including its name, description, and price, helping them make informed decisions about enrollment. |
| [3.4](#34-update-course) | Update Course | /courses/{courseId} | PUT | Updates the details of an existing culinary course, including its name, description, and price. This function enables administrators to modify course information as needed, such as updating course content, adjusting pricing, or refining course descriptions. |
| [3.5](#35-delete-course) | Delete Course | /courses/{courseId} | DELETE | Deletes a culinary course by its ID. This function allows administrators to remove courses that are no longer offered or relevant, ensuring that the course catalog remains up-to-date and streamlined. |
| [4.1](#41-list-categories-in-a-course) | List Categories in a Course | /courses/{courseId}/categories | GET | Retrieves a list of categories within a specific culinary course. This function provides users with an overview of the different recipe categories available within a course, allowing them to explore recipes based on their interests or preferences. |
| [4.2](#42-create-category) | Create Category | /courses/{courseId}/categories | POST | Adds a new category to a specific culinary course. This function enables administrators to organize recipes into distinct categories, facilitating easier navigation and exploration for users looking for specific types of recipes. |
| [4.3](#43-delete-category) | Delete Category | /courses/{courseId}/categories/{categoryId} | DELETE | Deletes a category from a culinary course. This function allows administrators to remove categories that are no longer needed or relevant, helping maintain a well-organized and efficient categorization system for recipes. |
| [5.1](#51-list-recipes-in-a-category) | List Recipes in a Category | /courses/{courseId}/categories/{categoryId}/recipes | GET | Retrieves a list of recipes within a specific category of a culinary course. This function provides users with access to a curated list of recipes belonging to a particular category, enabling them to discover and explore recipes tailored to their preferences. |
| [5.2](#52-create-recipe) | Create Recipe | /courses/{courseId}/categories/{categoryId}/recipes | POST | Adds a new recipe to a specific category of a culinary course. This function enables administrators to expand the repertoire of available recipes within a category, providing users with a wider selection of culinary options to explore and try out. |
| [5.3](#53-update-recipe) | Update Recipe | /courses/{courseId}/categories/{categoryId}/recipes/{recipeId} | PUT | Updates the details of a specific recipe within a category of a culinary course. This function enables administrators to modify recipe information as needed, such as correcting errors, updating ingredient lists, or revising cooking instructions. |
| [5.4](#54-delete-recipe) | Delete Recipe | /courses/{courseId}/categories/{categoryId}/recipes/{recipeId} | DELETE | Deletes a specific recipe from a category of a culinary course. This function allows administrators to remove recipes that are no longer offered or relevant, helping maintain an up-to-date and relevant collection of recipes for users to explore. |

## Endpoints
---------------------------------------------------------------

### 1. Login
-------------------------------------------------------------

#### 1.1. Login

| End Point | Method |
|-----------|--------|
| /login    | POST |

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

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /logout   | POST   | Required (Bearer Token) |

### 2. User Management
----------------------------------------------------

Manage user accounts using the following endpoints:

#### 2.1. Create User

| End Point | Method |
|-----------|--------|
| /users  | POST   | 

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /users/{username}  | GET   | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /users/{username}  | PUT   | Required (Bearer Token)|

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

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /users/{username}  | DELETE  | Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username of the user to be deleted.|

- **Response:** HTTP Status Code 204 (No Content)

### 3. Culinary Courses
--------------------------------------------------------------------

Manage culinary courses using the following endpoints:

#### 3.1. List All Courses

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses  | GET   | Required (Bearer Token)|

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

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /courses  | POST   | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}  | GET   | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}  | PUT   | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}  | DELETE   | Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|

- **Response:** HTTP Status Code 204 (No Content)

### 4. Recipe Categories
----------------------------------------------------------------

Manage recipe categories within culinary courses using the following endpoints:

#### 4.1. List Categories in a Course

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories  | GET   | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories  | POST   | Required (Bearer Token)|

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

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories/{categoryId}  | DELETE  | Required (Bearer Token)|

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

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes  | GET   | Required (Bearer Token)|

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
       9. Serve hot and enjoy!",
     "imageURL": "https://example.com/tomato-basil-soup.jpg"
    },
    // Additional recipe objects
  ]

#### 5.2. Create Recipe

| End Point | Method |Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes  | POST   | Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| title      | string    | Title of the new recipe.|
| ingredients| array     | List of ingredients required for the recipe.|
| instructions| string   | Step-by-step instructions for preparing the recipe.|
| imageURL   | string    | URL of an image representing the finished dish (optional).|

- **Request:**
  ```json
  {
    "title": "Pasta Primavera",
    "ingredients": ["8 oz pasta (linguine or fettuccine work well)", "2 tablespoons olive oil", "3 cloves garlic, minced", 
    "1 cup cherry tomatoes, halved", "1 cup broccoli florets", "1 cup bell peppers, sliced", "1/2 cup peas", "1/4 cup 
    grated Parmesan cheese", "Salt and pepper to taste"],
    "instructions": "1. Cook pasta according to package instructions. 2. In a large skillet, heat olive oil over medium 
    heat. 3. Add minced garlic and sauté until fragrant. 4. Add cherry tomatoes, broccoli, bell peppers, and peas. 5. 
    Sauté until vegetables are tender. 6. Add cooked pasta to the skillet and toss to combine. 7. Season with salt and 
    pepper. 8. Serve hot with grated Parmesan cheese on top. 9. Enjoy!",
    "imageURL": "https://example.com/pasta-primavera.jpg"
  }
- **Response:**
  ```json
  {
    "recipeId": "new_recipe_id",
    "title": "Pasta Primavera",
    "ingredients": ["8 oz pasta (linguine or fettuccine work well)", "2 tablespoons olive oil", "3 cloves garlic, minced", 
    "1 cup cherry tomatoes, halved", "1 cup broccoli florets", "1 cup bell peppers, sliced", "1/2 cup peas", "1/4 cup 
    grated Parmesan cheese", "Salt and pepper to taste"],
    "instructions": "1. Cook pasta according to package instructions. 2. In a large skillet, heat olive oil over medium 
    heat. 3. Add minced garlic and sauté until fragrant. 4. Add cherry tomatoes, broccoli, bell peppers, and peas. 5. 
    Sauté until vegetables are tender. 6. Add cooked pasta to the skillet and toss to combine. 7. Season with salt and 
    pepper. 8. Serve hot with grated Parmesan cheese on top. 9. Enjoy!",
    "imageURL": "https://example.com/pasta-primavera.jpg"
  }

#### 5.3. Update Recipe

| End Point | Method | Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}  | PUT   | Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| recipeId   | string    | Unique identifier of the recipe to update.|
| title      | string    | New title of the recipe.|
| ingredients| array     | New list of ingredients for the recipe.|
| instructions| string   | New step-by-step instructions for preparing the recipe.|
| imageURL   | string    | New URL of an image representing the finished dish (optional).|

- **Request:**
  ```json
  {
    "title": "Chicken Alfredo Pasta",
    "ingredients": ["8 oz pasta (fettuccine or spaghetti)", "2 boneless, skinless chicken breasts, thinly sliced", "2 
    tablespoons olive oil", "3 cloves garlic, minced", "1 cup heavy cream", "1/2 cup grated Parmesan cheese", "Salt and 
    pepper to taste", "Chopped parsley for garnish (optional)"],
    "instructions": "1. Cook pasta according to package instructions. 2. In a large skillet, heat olive oil over medium-
    high heat. 3. Add minced garlic and sauté until fragrant. 4. Add sliced chicken breasts and cook until no longer pink. 
    5. Reduce heat to medium-low. 6. Add heavy cream and grated Parmesan cheese. 7. Simmer until sauce thickens. 8. 
    Season with salt and pepper. 9. Add cooked pasta to the skillet and toss to coat in sauce. 10. Serve hot with chopped 
    parsley on top. 11. Enjoy!",
    "imageURL": "https://example.com/chicken-alfredo-pasta.jpg"
  }
- **Response:**
  ```json
  {
    "recipeId": "updated_recipe_id",
    "title": "Chicken Alfredo Pasta",
    "ingredients": ["8 oz pasta (fettuccine or spaghetti)", "2 boneless, skinless chicken breasts, thinly sliced", "2 
    tablespoons olive oil", "3 cloves garlic, minced", "1 cup heavy cream", "1/2 cup grated Parmesan cheese", "Salt and 
    pepper to taste", "Chopped parsley for garnish (optional)"],
    "instructions": "1. Cook pasta according to package instructions. 2. In a large skillet, heat olive oil over medium-
    high heat. 3. Add minced garlic and sauté until fragrant. 4. Add sliced chicken breasts and cook until no longer pink. 
    5. Reduce heat to medium-low. 6. Add heavy cream and grated Parmesan cheese. 7. Simmer until sauce thickens. 8. 
    Season with salt and pepper. 9. Add cooked pasta to the skillet and toss to coat in sauce. 10. Serve hot with chopped 
    parsley on top. 11. Enjoy!",
    "imageURL": "https://example.com/chicken-alfredo-pasta.jpg"
  }

#### 5.4. Delete Recipe

| End Point | Method |Authentication |
|-----------|--------|----------------|
| /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}  | DELETE   | Required (Bearer Token)|

##### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|
| categoryId | string    | Unique identifier of the category.|
| recipeId   | string    | Unique identifier of the recipe to delete.|

- **Response:** HTTP Status Code 204 (No Content)
## Conclusion
The API follows a RESTful architecture, with clear and consistent endpoint naming conventions and request/response structures. Input fields for each function are well-defined, ensuring data integrity and consistency throughout interactions with the API. Similarly, output fields provide comprehensive information, allowing users to easily consume and utilize the data returned by API requests.
Overall, the Culinary Course API provides a robust platform for culinary education and recipe management, empowering developers to build innovative applications and services in the culinary domain.
