# Design Document: Menu Management System
## Introduction
-----------------------------------------------------------
This design document outlines the specifications and design considerations for the menu management system of a restaurant website. It provides detailed information on functional requirements, architectural design, database structure, rule engine configurations, and security measures.
## Assumptions
--------------------------------------------------------------------------------------------
- Users have basic knowledge of the restaurant website.
- Menu items and prices are subject to change.
- Users have necessary permissions to access and modify menu settings.
## Functional Specifications
-----------------------------------------------------------------------------------
- The system allows users to configure menu items and prices.
- Presentation layer provides intuitive interfaces for user interaction.
- Service/orchestration layer manages business logic and communication between components.
- Database layer stores and retrieves menu data efficiently.
- Rule engine validates menu item configurations.
- Configuration changes are logged for auditing purposes.
- Security measures are implemented to protect sensitive data.
## Attribute Definition
------------------------------------------------------------------------------------
| Field Label | Default Settings | Validation | Remarks |
|-------------|------------------|------------|---------|
| Item Name   | -                | Alphanumeric, 1-50 characters | Name of the menu item. |
| Item Price  | -                | Numeric, range: 0-1000 | Price of the menu item. |
## Presentation Layer/Screen Design
-------------------------------------------------------------------------------------
1. **Screen Name**: Menu Configuration
   - **Project**: Restaurant Website
   - **Description**: Allows restaurant managers to update menu items and prices.
   - **Functionality**: Managers can view and update menu configurations.

   | Action | Condition | Response | Layer | Exception Type | Messages |
   |--------|-----------|----------|-------|----------------|----------|
   | Call `updateMenuItemPrice(item, newPrice)` method | Menu item exists | Menu item price is updated | Service | - | - |
   | - | Menu item does not exist | Error: Menu item not found | Service | NotFoundException | "Menu item not found." |

2. **Screen Name**: Menu Preview
   - **Project**: Restaurant Website
   - **Description**: Displays the current menu items and prices to customers.
   - **Functionality**: Customers can browse available menu options.

   | Action | Condition | Response | Layer | Exception Type | Messages |
   |--------|-----------|----------|-------|----------------|----------|
   | Call `getName()` method | Menu item exists | Returns the name of the menu item | Service | - | - |
   | - | Menu item does not exist | Error: Menu item not found | Service | NotFoundException | "Menu item not found." |

3. **Screen Name**: Menu Item Creation
   - **Project**: Restaurant Website
   - **Description**: Allows administrators to add new menu items.
   - **Functionality**: Administrators can enter details such as item name and price.

   | Action | Condition | Response | Layer | Exception Type | Messages |
   |--------|-----------|----------|-------|----------------|----------|
   | Call `addItem(item)` method | Category exists | Menu item is added to the category | Service | - | - |
   | - | Category does not exist | Error: Category not found | Service | NotFoundException | "Category not found." |
## Service/Orchestration Layer Design
----------------------------------------------------------------------------------------
- **Entity Library**: Contains classes and methods for menu item management.
### Entity Library: Menu Management

1. **Class Name**: MenuItem
   - **Methods**:
     - `getName()`: Retrieves the name of the menu item.
     - `getPrice()`: Retrieves the price of the menu item.
     - `setDescription(description)`: Sets a description for the menu item.

2. **Class Name**: MenuCategory
   - **Methods**:
     - `getCategoryName()`: Retrieves the name of the menu category.
     - `addItem(item)`: Adds a menu item to the category.
     - `removeItem(item)`: Removes a menu item from the category.

3. **Class Name**: MenuManager
   - **Methods**:
     - `addMenuItem(item)`: Adds a new menu item to the system.
     - `removeMenuItem(item)`: Removes a menu item from the system.
     - `updateMenuItemPrice(item, newPrice)`: Updates the price of a menu item.
## Database Layer Design
-----------------------------------------------------------------------------------------
1. **OLTP Area Changes**

| Sr. No. | Name of the Procedure | New/Existing | Remarks |
|---------|-----------------------|--------------|---------|
| 1       | UpdateMenuItemPrice   | Existing     | Adds support for updating menu item prices. |
| 2       | AddMenuItem           | New          | Adds support for inserting new menu items. |
| 3       | DeleteMenuItem        | New          | Adds support for deleting menu items. |
## Rule Engine Changes
-------------------------------------------------------------------------------------------
1. **Menu Item Validation Rule**
   
| Sr. No. | Rule Name              | Parameter Name | Parameter Type | Rule Logic                            | Remarks                                   |
|---------|------------------------|----------------|----------------|---------------------------------------|-------------------------------------------|
| 1       | MenuItemValidationRule | Item Price     | Numeric        | Validates numeric values within a specified range (0-1000). | Ensures data integrity and prevents invalid prices. |
| 2       | MenuItemExistenceRule  | Item Name      | Alphanumeric   | Checks if the menu item already exists. | Prevents duplicate entries. |
| 3       | MenuItemNameLengthRule | Item Name      | Alphanumeric   | Validates the length of the item name. | Limits the length to 50 characters. |
## Configuration Changes
----------------------------------------------------------------------------------------
1. **Configuration Table Changes**
   
| Sr. No. | Configuration Table Name | New/Existing | Operations   | Remarks                   |
|---------|---------------------------|--------------|--------------|---------------------------|
| 1       | MenuItemConfig            | New          | Insert, Update, Delete | Stores menu item configurations and prices. |
| 2       | MenuCategoryConfig        | New          | Insert, Update, Delete | Stores menu item categories. |
| 3       | MenuItemImageConfig       | New          | Insert, Update, Delete | Stores image URLs for menu items. |
## Exceptions Logging
------------------------------------------------------------------------------------------
- **Scenario**: Menu Configuration Update Failure
   - **Exception/Failure**: DatabaseError
   - **Outcome**: Rollback changes and log error details.
## Security Requirements
----------------------------------------------------------------------------------------
- Implement encryption for sensitive data.
- Enforce access control to restrict unauthorized access.
## Dependencies
----------------------------------------------------------------------------------------
- External libraries for database connectivity.
- Security modules for encryption and access control.
## Test Scenarios
-----------------------------------------------------------------------------------------
1. **Test Scenario No. 1**
   
| Test Scenario Description | Functional Specification | Prerequisite | Notes                   |
|---------------------------|--------------------------|--------------|-------------------------|
| Update Menu Item Price    | Verify system updates menu item price as expected. | Manager has permission to modify menu settings. | Ensure validation rules are enforced. |
## Conclusion
-------------------------------------------------------------------------------
Overall, this design document provides s foundation for the successful development and deployment of a restaurant website's menu management system. This helps in an enhanced user experience and improved efficiency for both managers and customers alike.
