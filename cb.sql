------------------------   DB CREATION ------------------------

CREATE TABLE Admins (
    admin_id SERIAL PRIMARY KEY,
    admin_email VARCHAR(255) NOT NULL,
    admin_password VARCHAR(255) NOT NULL
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_price INTEGER NOT NULL,
    item_image VARCHAR(255) NOT NULL,
    item_stock INTEGER NOT NULL CHECK (item_stock >= 0),
    item_description VARCHAR(255),
    category_id INTEGER REFERENCES Categories(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE User_Details (
    ud_id SERIAL PRIMARY KEY,
    pincode INTEGER	NOT NULL,
    state VARCHAR(255) NOT NULL,
    landmark VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    order_quantity INTEGER NOT NULL,
    item_id INTEGER REFERENCES Items(item_id) ON DELETE CASCADE ON UPDATE CASCADE,
    order_status BOOLEAN DEFAULT FALSE,
    ud_id INTEGER REFERENCES User_Details(ud_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    cart_id INTEGER REFERENCES Carts(cart_id) ON DELETE CASCADE ON UPDATE CASCADE,
    order_id INTEGER REFERENCES Orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    user_name VARCHAR(255) NOT NULL,
    user_phone_number VARCHAR(255) NOT NULL
);
CREATE TABLE Carts (
    cart_id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES Items(item_id) ON DELETE CASCADE ON UPDATE CASCADE,
    cart_quantity INTEGER DEFAULT 0
);
