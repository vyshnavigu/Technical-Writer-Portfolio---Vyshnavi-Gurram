# Culinary Course API Documentation
## Introduction
The **Culinary Course API** allows for efficient management of courses, categories, and recipes. This RESTful API uses JWT-based authentication and follows clear naming conventions for ease of use. Developers can interact with endpoints to create, retrieve, update, and delete data.

**Contact Email:** {vyshnavig28@gmail.com}
## Base URL
[https://app.swaggerhub.com/apis-docs/VYSHNAVIGU_1/CulinaryCourseAPI/9.9.9](https://app.swaggerhub.com/apis-docs/VYSHNAVIGU_1/CulinaryCourseAPI/9.9.9)
## Authentication
Authentication is handled using **JWT (JSON Web Tokens)**. You must log in with valid credentials to receive a token, which you can then include in the Authorization header for subsequent API requests. Authentication is required for most API endpoints.

**Example:**
```json
"Authorization": "Bearer <your_access_token>"
```
## API END Points
### Login
#### Login
- **Description:** Authenticates a user and generates a JWT token for authorization.
- **URL:** /login
- **Method:** POST
- **Data Params:**
  ```json
  {
  "username": "your_username",
  "password": "your_password"
  }
  ```
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "token": "your_access_token"
    }
    ```
- **Error Response:**
   - **Code:** 401 UNAUTHORIZED
   - **Content:**
     ```json
     {
     "error":"Invalid credentials"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/login",
   type: "POST",
   data: {
    username: "user123",
    password: "securePassword"
   },
    success: function(r) {
     console.log(r);
   }
  });
  ```
### User Management
#### Create User
- **Description:** Creates a new user account.
- **URL:** /users
- **Method:** POST
- **Data Params:**
  ```json
  {
  "username": "new_user",
  "password": "new_password"
  }
  ```
- **Success Response:**
  - **Code:** 201 CREATED
  - **Content:**
    ```json
    {
    "id": 3,
    "username": "new_user"
    }
    ```
- **Error Response:**
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Username already taken"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/users",
   type: "POST",
   data: {
    username: "new_user",
    password: "securePassword"
   },
    success: function(r) {
     console.log(r);
   }
  });
  ```
#### Get User By Name
- **Description:** Retrieves details of a specific user.
- **URL:** /users/{username}
- **Method:** GET
- **URL Params:**
   - **Required:**
      - **username (string) –** The username of the user.
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "id": "user_id",
    "username": "desired_username"
    }
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "User not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/users/john_doe",
   type: "GET",
   headers: {
    Authorization: "Bearer your_access_token"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Update User
- **Description:** Updates the password of an existing user.
- **URL:** /users/{username}
- **Method:** PUT
- **URL Params:**
   - **Required:**
      - **username (string) –** The username of the user.
- **Data Params:**
  ```json
  {
  "password": "new_password"
  }
  ```
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "id": "user_id",
    "username": "desired_username"
    }
    ```
- **Error Response:**
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Password is too weak"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/users/john_doe",
   type: "PUT",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   data: {
    password: "new_securePassword"
   },
   success: function(r) {
    console.log(r);
   }
  });
  ```
#### Delete User
- **Description:** Deletes a user account.
- **URL:** /users/{username}
- **Method:** DELETE
- **URL Params:**
   - **Required:**
      - **username (string) –** The username of the user.
- **Success Response:**
  - **Code:** 204 NO CONTENT
  - **Content:** Empty body.
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "User not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/users/john_doe",
   type: "DELETE",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   success: function() {
    console.log("User deleted");
   }
  });
  ```
### Culinary Courses
#### List All Courses
- **Description:** Retrieves a list of all available culinary courses.
- **URL:** /courses
- **Method:** GET
- **URL Params:**
   - **Optional:**
      - **page (integer) –** Page number for pagination.
        **Example:** page=1
      - **limit (integer) -** Number of courses per page.
        **Example:** limit=10
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    [
    {
    "courseId": "1",
    "name": "Baking Basics",
    "description": "Learn the fundamentals of baking.",
    "price": 29.99
    },
    {
    "courseId": "2",
    "name": "Italian Cuisine",
    "description": "Master authentic Italian recipes.",
    "price": 39.99
    }
    ]
    ```
- **Error Response:**
   - **Code:** 401 UNAUTHORIZED
   - **Content:**
     ```json
     {
     "error": "Token is missing or invalid"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses",
   type: "GET",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    page: 1,
    limit: 10
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Create Course
- **Description:** Adds a new culinary course to the catalog.
- **URL:** /courses
- **Method:** POST
- **Data Params:**
  ```json
  {
  "name": "Quick Meals",
  "description": "Simple and fast recipes for busy schedules.",
  "price": 19.99
  }
  ```
- **Success Response:**
  - **Code:** 201 CREATED
  - **Content:**
    ```json
    {
    "courseId": "3",
    "name": "Quick Meals",
    "description": "Simple and fast recipes for busy schedules.",
    "price": 19.99
    }
    ```
- **Error Response:**
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Course name already exists"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses",
   type: "POST",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    name: "Quick Meals",
    description: "Simple and fast recipes for busy schedules.",
    price: 19.99
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Get Course Details
- **Description:** Retrieves detailed information about a specific course.
- **URL:** /courses/{courseId}
- **Method:** GET
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course. 
        **Example:** courseId=1
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "courseId": "1",
    "name": "Baking Basics",
    "description": "Learn the fundamentals of baking.",
    "price": 29.99
    }
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Course not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1",
   type: "GET",
   headers: {
    Authorization: "Bearer your_access_token"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Update Course
- **Description:** Updates the details of an existing culinary course.
- **URL:** /courses/{courseId}
- **Method:** PUT
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course. 
        **Example:** courseId=1
- **Data Params:**
  ```json
  {
  "name": "Advanced Baking",
  "description": "Refine your baking skills with advanced techniques.",
  "price": 39.99
  }
  ```
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "courseId": "1",
    "name": "Advanced Baking",
    "description": "Refine your baking skills with advanced techniques.",
    "price": 39.99
    }
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Course not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1",
   type: "PUT",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    name: "Advanced Baking",
    description: "Refine your baking skills with advanced techniques.",
    price: 39.99
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Delete Course
- **Description:** Deletes a specific culinary course from the catalog.
- **URL:** /courses/{courseId}
- **Method:** DELETE
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
- **Success Response:**
  - **Code:** 204 NO CONTENT
  - **Content:** Empty body.
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Course not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1",
   type: "DELETE",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   success: function() {
    console.log("Course deleted");
   }
  });
  ```
### Recipe Categories
#### List Categories In A Course
- **Description:** Retrieves all recipe categories within a specific course.
- **URL:** /courses/{courseId}/categories
- **Method:** GET
- **URL Params:**
   - **Optional:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    [
    {
    "categoryId": "1",
    "name": "Desserts"
    },
    {
    "categoryId": "2",
    "name": "Appetizers"
    }
    ]
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Course not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories",
   type: "GET",
   headers: {
    Authorization: "Bearer your_access_token"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Create Category
- **Description:** Adds a new recipe category to a course.
- **URL:** /courses/{courseId}/categories
- **Method:** POST
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course. 
        **Example:** courseId=1
- **Data Params:**
  ```json
  {
  "name":"Main Dishes"
  }
  ```
- **Success Response:**
  - **Code:** 201 CREATED
  - **Content:**
    ```json
    {
    "categoryId": "3",
    "name": "Main Dishes"
    }
    ```
- **Error Response:**
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Category name already exists"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories",
   type: "POST",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    name: "Main Dishes"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Delete Category
- **Description:** Removes a recipe category from a course.
- **URL:** /courses/{courseId}/categories/{categoryId}
- **Method:** DELETE
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
      - **categoryId (string) –** Unique identifier of the category. 
        **Example:** categoryId=2
- **Success Response:**
  - **Code:** 204 NO CONTENT
  - **Content:** Empty body.
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Category not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories/2",
   type: "DELETE",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   success: function() {
    console.log("Category deleted");
   }
  });
  ```
### Recipes
#### List Recipes In A Category
- **Description:** Retrieves a list of recipes in a specific category within a course.
- **URL:** /courses/{courseId}/categories/{categoryId}/recipes
- **Method:** GET
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
      - **categoryId (string) –** Unique identifier of the category. 
        **Example:** categoryId=1
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    [
    {
    "recipeId": "1",
    "title": "Chocolate Cake",
    "ingredients": ["Flour", "Sugar", "Cocoa powder"],
    "instructions": "Mix all ingredients and bake.",
    "imageURL": "https://example.com/chocolate_cake.jpg"
    },
    {
    "recipeId": "2",
    "title": "Vanilla Ice Cream",
    "ingredients": ["Milk", "Sugar", "Vanilla extract"],
    "instructions": "Blend and freeze.",
    "imageURL": "https://example.com/vanilla_ice_cream.jpg"
    }
    ]
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Category not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories/2/recipes",
   type: "GET",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   success: function(r) {
    console.log(r);
   }
  });
  ```
#### Create Recipe
- **Description:** Adds a new recipe to a specific category within a course.
- **URL:** /courses/{courseId}/categories/{categoryId}/recipes
- **Method:** POST
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
      - **categoryId (string) –** The unique identifier of the category.
        **Example:** categoryId=1
- **Data Params:**
  ```json
  {
  "title": "Tomato Soup",
  "ingredients": ["Tomatoes", "Onions", "Garlic"],
  "instructions": "Boil tomatoes and blend.",
  "imageURL": "https://example.com/tomato_soup.jpg"
  }
  ```
- **Success Response:**
  - **Code:** 201 CREATED
  - **Content:**
    ```json
    {
    "recipeId": "3",
    "title": "Tomato Soup",
    "ingredients": ["Tomatoes", "Onions", "Garlic"],
    "instructions": "Boil tomatoes and blend.",
    "imageURL": "https://example.com/tomato_soup.jpg"
    }
    ```
- **Error Response:**
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Recipe title already exists"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories/1/recipes",
   type: "POST",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    title: "Tomato Soup",
    ingredients: ["Tomatoes", "Onions", "Garlic"],
    instructions: "Boil tomatoes and blend.",
    imageURL: "https://example.com/tomato_soup.jpg"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Update Recipe
- **Description:** Updates the details of an existing recipe within a category of a course.
- **URL:** /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}
- **Method:** PUT
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
      - **categoryId (string) –** The unique identifier of the category.
        **Example:** categoryId=1
      - **recipeId (string) -** The unique identifier of the recipe.
        **Example:** recipeId=1
- **Data Params:**
  ```json
  {
  "title": "Grilled Cheese Sandwich",
  "ingredients": ["Bread", "Cheese", "Butter"],
  "instructions": "Butter the bread, add cheese, and grill until golden brown.",
  "imageURL": "https://example.com/grilled_cheese.jpg"
  }
  ```
- **Success Response:**
  - **Code:** 200 OK
  - **Content:**
    ```json
    {
    "recipeId": "1",
    "title": "Grilled Cheese Sandwich",
    "ingredients": ["Bread", "Cheese", "Butter"],
    "instructions": "Butter the bread, add cheese, and grill until golden brown.",
    "imageURL": "https://example.com/grilled_cheese.jpg"
    }
    ```
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Recipe not found"
     }
     ```
   - **Code:** 422 UNPROCESSABLE ENTITY
   - **Content:**
     ```json
     {
     "error": "Invalid recipe data"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories/1/recipes/1",
   type: "PUT",
   headers: {
    Authorization: "Bearer your_access_token"
  },
  data: {
    title: "Grilled Cheese Sandwich",
    ingredients: ["Bread", "Cheese", "Butter"],
    instructions: "Butter the bread, add cheese, and grill until golden brown.",
    imageURL: "https://example.com/grilled_cheese.jpg"
  },
   success: function(r) {
    console.log(r);
  }
  });
  ```
#### Delete Recipe
- **Description:** Deletes a specific recipe from a category of a course.
- **URL:** /courses/{courseId}/categories/{categoryId}/recipes/{recipeId}
- **Method:** DELETE
- **URL Params:**
   - **Required:**
      - **courseId (string) –** The unique identifier of the course.
        **Example:** courseId=1
      - **categoryId (string) –** Unique identifier of the category.
        **Example:** categoryId=2
      - **recipeId (string) -** The unique identifier of the recipe.
        **Example:** recipeId=3
- **Success Response:**
  - **Code:** 204 NO CONTENT
  - **Content:** Empty body.
- **Error Response:**
   - **Code:** 404 NOT FOUND
   - **Content:**
     ```json
     {
     "error": "Recipe not found"
     }
     ```
- **Sample Call:**
  ```java
  $.ajax({
   url: "/courses/1/categories/2/recipes/3",
   type: "DELETE",
   headers: {
    Authorization: "Bearer your_access_token"
   },
   success: function() {
    console.log("Recipe deleted");
   }
  });
  ```
## Conclusion
This API facilitates the management of culinary courses, categories, and recipes using intuitive endpoints and JWT authentication. Ensure you follow the API documentation closely for proper integration. The provided samples should help with quick integration into your backend.
Overall, the Culinary Course API provides a robust platform for culinary education and recipe management, empowering developers to build innovative applications and services in the culinary domain.
