# Culinary Course API Documentation
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
## Endpoints
---------------------------------------------------------------
### 1. Login

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /login    | POST   | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities. | - |
#### Data Object Definition

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

### 2. Logout

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /logout   | POST   | Log out the currently authenticated user. | Required (Bearer Token) |

### 3. User Management

Manage user accounts using the following endpoints:

#### 3.1. Create User

| End Point | Method | Description |
|-----------|--------|-------------|
| /users  | POST   | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities.|

#### Data Object Definition

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

#### 3.2. Get User by Username

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | GET   | Retrieves user details by their username. This function allows administrators or other users to view information about a specific user, such as their ID and username.| Required (Bearer Token)|

#### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username for the user to retrieve their details.|

- **Response:**
  ```json
  {
    "id": "user_id",
    "username": "desired_username"
  }

#### 3.3. Update User

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | PUT   | Updates the password of an existing user account. This function enables users to change their passwords for security reasons or due to a forgotten password, providing them with the ability to maintain the security of their accounts.| Required (Bearer Token)|

#### Data Object Definition

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

#### 3.4. Delete User

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /users/{username}  | DELETE   | Deletes a user account by their username. This function allows administrators to remove user accounts that are no longer needed or to handle account deletions requested by users, ensuring proper management of user data.| Required (Bearer Token)|

#### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username of the user to be deleted.|

- **Response:** HTTP Status Code 204 (No Content)

### 4. Culinary Courses

Manage culinary courses using the following endpoints:

#### 4.1. List All Courses

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses  | GET   | Retrieves a list of all available culinary courses. This function provides users with an overview of the courses offered on the platform, including their names, descriptions, and prices, allowing them to browse and select courses of interest.| Required (Bearer Token)|

- **Response:**
  ```json
  [
    {
      "id": "course_id",
      "name": "Baking",
      "description": "Includes Recipe Catogeries and Recipes of Baking",
      "price": 26.99
    },
    // Additional course objects
  ]

#### 4.2. Create Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses  | POST   | Adds a new culinary course with the specified name, description, and price. This function enables administrators to expand the catalog of available courses by creating new ones, providing users with more options to choose from.| Required (Bearer Token)|

#### Data Object Definition

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
    "id": "new_course_id",
    "name": "Meals for One",
    "description": "Contains Recipe Catogeries and Recipes that are specifically designed for one person",
    "price": 29.99
  }

#### 4.3. Get Course Details

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}  | GET   | Retrieves details of a specific culinary course by its ID. This function allows users to view comprehensive information about a particular course, including its name, description, and price, helping them make informed decisions about enrollment.| Required (Bearer Token)|

#### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course.|

- **Response:**
  ```json
  {
    "id": "course_id",
    "name": "Course Name",
    "description": "Course Description",
    "price": 19.99
  }
  
#### 4.4. Update Course

| End Point | Method | Description | Authentication |
|-----------|--------|-------------|----------------|
| /courses/{courseId}  | PUT   | Updates the details of an existing culinary course, including its name, description, and price. This function enables administrators to modify course information as needed, such as updating course content, adjusting pricing, or refining course descriptions.| Required (Bearer Token)|

#### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| courseId   | string    | Unique identifier of the course to update.|
| name       | string    | New name of the course.|
| description| string    | New description of the course.|
| price      | float     | New price for the course.|

- **Request:**
  ```json
  {
    "name": "Updated Course Name",
    "description": "Updated Course Description",
    "price": 24.99
  }
- **Response:**
  ```json
  {
    "id": "course_id",
    "name": "Updated Course Name",
    "description": "Updated Course Description",
    "price": 24.99
  }

#### 4.5. Delete Course

- **Endpoint:** `/courses/{courseId}`
- **Method:** DELETE
- **Description:** Delete a specific culinary course.
- **Authentication:** Required (Bearer Token)
- **Response:** HTTP Status Code 204 (No Content)

### 5. Recipe Categories

Manage recipe categories within culinary courses using the following endpoints:

#### 5.1. List Categories in a Course

- **Endpoint:** `/courses/{courseId}/categories`
- **Method:** GET
- **Description:** Retrieve a list of categories within a specific culinary course.
- **Authentication: Required (Bearer Token)
- **Response:**
  ```json
  [
    {
      "id": "category_id",
      "name": "Category Name"
    },
    // Additional category objects
  ]

#### 5.2. Create Category

- **Endpoint:** `/courses/{courseId}/categories`
- **Method:** POST
- **Description:** Add a new category to a specific culinary course.
- **Authentication:** Required (Bearer Token)
- **Request:**
  ```json
  {
    "name": "New Category"
  }
- **Response:**
  ```json
  {
    "id": "new_category_id",
    "name": "New Category"
  }

#### 5.3. Delete Category

- **Endpoint:** `/courses/{courseId}/categories/{categoryId}`
- **Method:** DELETE
- **Description:** Delete a specific category from a culinary course.
- **Authentication:** Required (Bearer Token)
- **Response:** HTTP Status Code 204 (No Content)

### 6. Recipes

Manage recipes within recipe categories using the following endpoints:

#### 6.1. List Recipes in a Category

- **Endpoint:** `/courses/{courseId}/categories/{categoryId}/recipes`
- **Method:** GET
- **Description:** Retrieve a list of recipes within a specific category of a culinary course.
- **Authentication:** Required (Bearer Token)
- **Response:**
  ```json
  [
    {
      "id": "recipe_id",
      "title": "Recipe Title",
      "ingredients": ["Ingredient 1", "Ingredient 2"],
      "instructions": "Recipe Instructions",
      "image_url": "Recipe Image URL"
    },
    // Additional recipe objects
  ]

#### 6.2. Create Recipe

- **Endpoint:** `/courses/{courseId}/categories/{categoryId}/recipes`
- **Method:** POST
- **Description:** Add a new recipe to a specific category of a culinary course.
- **Authentication:** Required (Bearer Token)
- **Request:**
  ```json
  {
    "title": "New Recipe Title",
    "ingredients": ["Ingredient 1", "Ingredient 2"],
    "instructions": "Recipe Instructions",
    "image_url": "Recipe Image URL"
  }
- **Response:**
  ```json
  {
    "id": "new_recipe_id",
    "title": "New Recipe Title",
    "ingredients": ["Ingredient 1", "Ingredient 2"],
    "instructions": "Recipe Instructions",
    "image_url": "Recipe Image URL"
  }

#### 6.3. Update Recipe

- **Endpoint:** `/courses/{courseId}/categories/{categoryId}/recipes/{recipeId}`
- **Method:** PUT
- **Description:** Update the details of a specific recipe within a category of a culinary course.
- **Authentication:** Required (Bearer Token)
- **Request:**
  ```json
  {
    "title": "Updated Recipe Title",
    "ingredients": ["Updated Ingredient 1", "Updated Ingredient 2"],
    "instructions": "Updated Recipe Instructions",
    "image_url": "Updated Recipe Image URL"
  }
- **Response:**
  ```json
  {
    "id": "recipe_id",
    "title": "Updated Recipe Title",
    "ingredients": ["Updated Ingredient 1", "Updated Ingredient 2"],
    "instructions": "Updated Recipe Instructions",
    "image_url": "Updated Recipe Image URL"
  }

#### 6.4. Delete Recipe

- **Endpoint:** `/courses/{courseId}/categories/{categoryId}/recipes/{recipeId}`
- **Method:** DELETE
- **Description:** Delete a specific recipe from a category of a culinary course.
- **Authentication:** Required (Bearer Token)
- **Response:** HTTP Status Code 204 (No Content)
