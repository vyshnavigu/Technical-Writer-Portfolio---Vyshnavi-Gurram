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

| End Point | Method | Description |
|-----------|--------|-------------|
| /login    | POST   | Creates a new user account with the provided username and password. This function allows new users to register for the culinary course platform, providing them access to various features and functionalities. |
#### Data Object Definition

| Data Field | Data Type | Description |
|------------|-----------|-------------|
| username   | string    | Username of the new user.|

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

- **Endpoint:** `/logout`
- **Method:** POST
- **Description:** Log out the currently authenticated user.
- **Authentication:** Required (Bearer Token)

### 3. User Management

Manage user accounts using the following endpoints:

#### 3.1. Create User

- **Endpoint:** `/users`
- **Method:** POST
- **Description:** Create a new user account.
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

- **Endpoint:** `/users/{username}`
- **Method:** GET
- **Description:** Retrieve user details by username.
- **Authentication:** Required (Bearer Token)
- **Response:**
  ```json
  {
    "id": "user_id",
    "username": "desired_username"
  }

#### 3.3. Update User

- **Endpoint:** `/users/{username}`
- **Method:** PUT
- **Description:** Update user details.
- **Authentication:** Required (Bearer Token)
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

- **Endpoint:** `/users/{username}`
- **Method:** DELETE
- **Description:** Delete a user account.
- **Authentication:** Required (Bearer Token)
- **Response:** HTTP Status Code 204 (No Content)

### 4. Culinary Courses

Manage culinary courses using the following endpoints:

#### 4.1. List All Courses

- **Endpoint:** `/courses`
- **Method:** GET
- **Description:** Retrieve a list of available culinary courses.
- **Authentication:** Required (Bearer Token)
- **Response:**
  ```json
  [
    {
      "id": "course_id",
      "name": "Course Name",
      "description": "Course Description",
      "price": 19.99
    },
    // Additional course objects
  ]

#### 4.2. Create Course

- **Endpoint:** `/courses`
- **Method:** POST
- **Description:** Add a new culinary course.
- **Authentication:** Required (Bearer Token)
- **Request:**
  ```json
  {
    "name": "New Course",
    "description": "Course Description",
    "price": 29.99
  }
- **Response:**
  ```json
  {
    "id": "new_course_id",
    "name": "New Course",
    "description": "Course Description",
    "price": 29.99
  }

#### 4.3. Get Course Details

- **Endpoint:** `/courses/{courseId}`
- **Method:** GET
- **Description:** Retrieve the details of a specific culinary course.
- **Authentication:** Required (Bearer Token)
- **Response:**
  ```json
  {
    "id": "course_id",
    "name": "Course Name",
    "description": "Course Description",
    "price": 19.99
  }
  
#### 4.4. Update Course

- **Endpoint:** `/courses/{courseId}`
- **Method:** PUT
- **Description:** Update the details of a specific culinary course.
- **Authentication:** Required (Bearer Token)
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
