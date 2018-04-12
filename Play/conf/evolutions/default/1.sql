# --- !Ups

CREATE TABLE users(
	id bigint,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	phone varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	city varchar(255) NOT NULL,
	token varchar(36),
	PRIMARY KEY (id)
);

INSERT INTO users (id, email, password, firstName, lastname, phone, country, city) VALUES (3000, 'irfankr91@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Irfan', 'Krijestorac', '061506652', 'Bosnia and Herzegovina', 'Sarajevo');

CREATE TABLE restaurants(
	id bigint,
	restaurantName varchar(255) NOT NULL,
	description varchar(10000) NOT NULL,
	latitude float NOT NULL,
	longitude float NOT NULL,
	mark float NOT NULL,
	votes bigint NOT NULL,
	priceRange bigint NOT NULL,
	imageFileName varchar(255) NOT NULL,
	coverFileName varchar(255) NOT NULL,
	location bigint NOT NULL,
	foodType varchar(255) NOT NULL,
	PRIMARY KEY (id)
);



INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3001, 'Baja Fresh', 'In August 1990, Baja Fresh Mexican Grill opened its first restaurant featuring all-fresh, traditional fire-grilled Mexican favorites. Like many who grew up on fast food, we realized that it was time for something else, something different and something FRESH. Baja Fresh continues to be passionate about serving the freshest and high quality food in bright, clean environments. We believe in the benefits of eating well, being active and making a contribution to the communities we serve. We call this philosophy  Live Fresh  and you ll find this attitude in everything we do. We choose handmade and farm fresh not tin-canned, freshly prepared over microwaves and freezers. Flavor and nutrition over fillers and fads. At Baja Fresh you ll find eating well is a way of life and a state of mind. We believe in real food made with passion, for real people. Food that s always prepared by hand from real recipes and real farm fresh ingredients. Life should be full of variety, zest and positive energy. Energized by good health and good nutrition. We invite you to Eat Well and Live Fresh by making Baja Fresh a part of your active daily lifestyle.', 33.758599, -84.388575, 18, 4, 4, 'https://s3.amazonaws.com/atlantpraksa/d8b5eee6-167f-49dd-a46f-a1bf6c6aec52.jpg', 3001, 'Mexican/Southwestern | Quick Service', 'https://s3.amazonaws.com/atlantpraksa/d73e4720-160e-4c7e-807e-e041f830fa23.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3002, 'Wingz N Tingz', 'We believe in the benefits of eating well, being active and making a contribution to the communities we serve. We call this philosophy  Live Fresh  and you ll find this attitude in everything we do. We choose handmade and farm fresh not tin-canned, freshly prepared over microwaves and freezers. Flavor and nutrition over fillers and fads. At Baja Fresh you ll find eating well is a way of life and a state of mind. We believe in real food made with passion, for real people. Food that s always prepared by hand from real recipes and real farm fresh ingredients. Life should be full of variety, zest and positive energy.', 42.372756, -71.062121, 28, 6, 2, 'https://s3.amazonaws.com/atlantpraksa/7952eea4-d92f-417e-b0ce-ff1b7c2148db.jpg', 3002, 'American', 'https://s3.amazonaws.com/atlantpraksa/a997bbc9-a1be-403c-8ad9-ed45e7fb8625.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3003, 'Tassili Raw', 'Tassilis Raw Reality is a fast casual restaurant located in Atlanta, Georgia. We specialize in raw vegan cuisines and provide an unique variety of raw vegan entrees like spicy kale salad, kale wraps, and more. Our story starts with our purpose to help people achieve optimal health and thrive. What does that look like. That looks like our vision, to create an employee-owned raw vegan restaurant franchise in every continent in the world. About 6 years ago, Tassili Maat passionately set out to make the best kale in Atlanta, super food that is delicious as healthy. Today, Her brand Tassils Raw Reality is recognized around the world for the best kale in Atlanta and its attractive Afrocentric ambiance. ', 41.896271, -87.726974, 70, 25, 5, 'https://s3.amazonaws.com/atlantpraksa/426e923c-d400-4f7e-bcf9-dbe7bd0303b0.jpg', 3003, 'Vegetarian | Vegan', 'https://s3.amazonaws.com/atlantpraksa/72d8acbd-da06-4a13-b85d-66cd552eb5cb.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3004, 'Sufis', 'Tassilis Raw Reality is a fast casual restaurant located in Atlanta, Georgia. We specialize in raw vegan cuisines and provide an unique variety of raw vegan entrees like spicy kale salad, kale wraps, and more. Our story starts with our purpose to help people achieve optimal health and thrive. What does that look like. That looks like our vision, to create an employee-owned raw vegan restaurant franchise in every continent in the world. About 6 years ago, Tassili Maat passionately set out to make the best kale in Atlanta, super food that is delicious as healthy. Today, Her brand Tassils Raw Reality is recognized around the world for the best kale in Atlanta and its attractive Afrocentric ambiance. ', 33.754960, -84.383693, 120, 25, 2, 'https://s3.amazonaws.com/atlantpraksa/4aa4cbb6-2fa6-48ba-b282-8a276461316b.jpg', 3001, 'Middle Eastern', 'https://s3.amazonaws.com/atlantpraksa/a5fe69ce-b27f-4f2b-a979-3f4915b5c418.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3005, 'All About BBQ', 'Tassilis Raw Reality is a fast casual restaurant located in Atlanta, Georgia. We specialize in raw vegan cuisines and provide an unique variety of raw vegan entrees like spicy kale salad, kale wraps, and more. Our story starts with our purpose to help people achieve optimal health and thrive. What does that look like. That looks like our vision, to create an employee-owned raw vegan restaurant franchise in every continent in the world. About 6 years ago, Tassili Maat passionately set out to make the best kale in Atlanta, super food that is delicious as healthy. Today, Her brand Tassils Raw Reality is recognized around the world for the best kale in Atlanta and its attractive Afrocentric ambiance. ', 40.770320, -73.956582, 10, 3, 3, 'https://s3.amazonaws.com/atlantpraksa/7b9a55cd-e407-4a15-b49c-47f8156cf3ed.jpg', 3004, 'Barbeque', 'https://s3.amazonaws.com/atlantpraksa/3ec64b31-e74f-418d-9eaa-3998fbcc4091.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3006, 'Pasta n Pizza', 'Fresh and bursting with flavor is what Pizza n Pasta at Westland Mall has to offer. Serving the Miami, FL area we provide great tasting food thats prepared. As a leading Italian Fast Food Restaurant, we take pride in offering the best Pasta dishes, Pizzas and Italian Dishes. We are dedicated to serving the needs of our customers each and every day.', 39.989825, -75.145061, 70, 25, 1, 'https://s3.amazonaws.com/atlantpraksa/7f6fe280-8539-4a89-8092-888c5f2ae8e4.jpg', 3005, 'Pizza, Italian', 'https://s3.amazonaws.com/atlantpraksa/3d71e68b-a825-40f6-8655-207939cd9f90.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3007, 'Mughlai Cuisine', 'Mughlai Indian Cuisine believes in mastering the art of fine, delicious and well prepared meals that route their way from the rich lands of India to serving our diverse New Yorkers and curious Tourists. Located in the heart of NYC, Experience the taste of Mughlai as it treats each individual with delightful, aromatic and handpicked cuisines prepared by our Royal Master Chefs. The team at Mughlai Indian Cuisine follows a simple motto, to prepare and to serve because that’s what you deserve, The Golden Taste of India.', 42.377560, -71.062976, 320, 75, 3, 'https://s3.amazonaws.com/atlantpraksa/06988710-60a3-4974-a3a8-73f2682adde8.jpg', 3002, 'Indian', 'https://s3.amazonaws.com/atlantpraksa/ebd6c22c-8793-4e18-b529-8922c3f1b13b.jpg');
INSERT INTO restaurants (id, restaurantName, description, latitude, longitude, mark, votes, priceRange, imageFileName, location, foodType, coverFileName) VALUES (3008, 'Suki Japanese', 'Mughlai Indian Cuisine believes in mastering the art of fine, delicious and well prepared meals that route their way from the rich lands of India to serving our diverse New Yorkers and curious Tourists. Located in the heart of NYC, Experience the taste of Mughlai as it treats each individual with delightful, aromatic and handpicked cuisines prepared by our Royal Master Chefs. The team at Mughlai Indian Cuisine follows a simple motto, to prepare and to serve because that’s what you deserve, The Golden Taste of India.', 25.778793, -80.217120, 60, 30, 5, 'https://s3.amazonaws.com/atlantpraksa/b50f6cb9-a66f-4c00-a5b2-881932b8c787.jpg', 3003, 'Indian', 'https://s3.amazonaws.com/atlantpraksa/a8f536ad-6eb4-409f-b255-17d4005ce080.jpg');





CREATE TABLE restauranttables(
	id bigint,
	idRestaurant bigint NOT NULL,
	sittingPlaces bigint NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3001, 3001, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3002, 3001, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3003, 3001, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3004, 3001, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3005, 3001, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3006, 3001, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3007, 3001, 4);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3008, 3002, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3009, 3002, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3010, 3002, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3011, 3002, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3012, 3002, 12);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3013, 3002, 8);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3014, 3002, 4);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3015, 3003, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3016, 3003, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3017, 3003, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3018, 3003, 4);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3019, 3004, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3020, 3004, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3021, 3004, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3022, 3004, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3023, 3004, 10);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3024, 3004, 8);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3025, 3004, 4);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3026, 3005, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3027, 3005, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3028, 3005, 8);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3029, 3005, 10);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3030, 3005, 10);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3031, 3005, 7);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3032, 3005, 6);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3033, 3006, 2);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3034, 3006, 3);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3035, 3006, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3036, 3006, 4);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3037, 3006, 8);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3038, 3006, 8);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3039, 3007, 10);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3040, 3007, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3041, 3007, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3042, 3007, 6);

INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3043, 3008, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3044, 3008, 2);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3045, 3008, 6);
INSERT INTO restauranttables (id, idRestaurant, sittingPlaces) VALUES (3046, 3008, 8);

CREATE TABLE reservations(
	id bigint,
	idTable bigint NOT NULL,
	idUser bigint NOT NULL,
	Persons bigint NOT NULL,
    reservationDateTime timestamp NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE restaurantcategories(
	id bigint,
	name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO restaurantcategories (id, name) VALUES (3001, 'Vegetarian');
INSERT INTO restaurantcategories (id, name) VALUES (3002, 'American');
INSERT INTO restaurantcategories (id, name) VALUES (3003, 'Barbeque');

CREATE TABLE restaurantstocategories(
	id bigint,
	idRestaurant bigint NOT NULL,
    idCategory bigint NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE restaurantlocations(
	id bigint,
	name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE restaurantcomments(
    id bigint,
    mark bigint NOT NULL,
    idUser bigint NOT NULL,
    idRestaurant bigint NOT NULL,
    comment varchar(10000),
    insertTime timestamp NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE restaurantgalleryimages(
    id bigint,
    idRestaurant bigint NOT NULL,
    imageFileName varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO restaurantlocations (id, name) VALUES (3001, 'New York');
INSERT INTO restaurantlocations (id, name) VALUES (3002, 'Chicago');
INSERT INTO restaurantlocations (id, name) VALUES (3003, 'Boston');
INSERT INTO restaurantlocations (id, name) VALUES (3004, 'Philadelphia');
INSERT INTO restaurantlocations (id, name) VALUES (3005, 'Atlanta');
INSERT INTO restaurantlocations (id, name) VALUES (3006, 'Miami');


INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3001, 3001, 3001);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3002, 3001, 3002);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3003, 3002, 3003);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3004, 3003, 3002);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3005, 3004, 3001);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3006, 3004, 3003);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3007, 3005, 3002);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3008, 3006, 3003);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3009, 3007, 3001);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3010, 3007, 3002);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3011, 3007, 3003);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3012, 3008, 3002);
INSERT INTO restaurantstocategories (id, idRestaurant, idCategory) VALUES (3013, 3008, 3003);

INSERT INTO restaurantcomments (id, mark, idUser, idRestaurant, comment, insertTime) VALUES (3001, 3, 3000, 3002, 'I like it', now());
INSERT INTO restaurantcomments (id, mark, idUser, idRestaurant, comment, insertTime) VALUES (3002, 2, 3000, 3001, 'Average food', now());
INSERT INTO restaurantcomments (id, mark, idUser, idRestaurant, comment, insertTime) VALUES (3003, 4, 3000, 3003, 'Really nice place', now());
INSERT INTO restaurantcomments (id, mark, idUser, idRestaurant, comment, insertTime) VALUES (3004, 1, 3000, 3004, 'I dont like it', now());
INSERT INTO restaurantcomments (id, mark, idUser, idRestaurant, comment, insertTime) VALUES (3005, 5, 3000, 3005, 'Amazing restaurant', now());

INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3000, 3001, '4141e735-6f70-44b2-aa8b-9026f4a87171.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3001, 3001, '97a754f0-d665-4f78-a59e-2f7ec4c39f86.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3002, 3001, '3c9a6fdf-832e-4dae-9237-9e86b0e2f517.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3003, 3001, '47387a33-ad26-44fc-af92-11b94c339662.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3004, 3001, '60a88714-40a5-482e-96bf-f87f4128966d.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3005, 3001, '1acba22c-383c-49fd-9d3b-451537971993.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3006, 3001, '4b8e9bc5-bdcf-4718-8793-e26074082352.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3007, 3001, 'acc6fa69-7094-478d-83d9-cca2d0142387.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3008, 3001, 'f17547a8-e30f-44bf-9568-f991fdd76685.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (3009, 3002, '03483305-df0d-4b5b-b895-5630ac4cea64.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4000, 3002, '7edac707-278b-43a5-b29b-04d9412237a3.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4001, 3002, '9ac4fb4a-29a2-47b4-9267-a2a6cadacf17.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4002, 3002, '15dd0b63-9fc5-4f6a-9b97-2230f49417ec.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4003, 3004, '88236ffb-2d2e-423e-9f26-3c6d79571fdd.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4004, 3004, '0a0b1220-4e26-4728-8166-4b377ab85bee.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4005, 3004, 'dc05b06c-d516-4edf-aeb0-164399a842f3.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4006, 3004, '87036032-5883-48bb-bff3-991b9edab488.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4007, 3004, '6d08453c-2b5b-452f-8eeb-bfa95db4e8f4.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4008, 3004, 'd967c0aa-2c1b-435d-bf98-e965acbd3dd6.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (4009, 3004, '19a6e20a-4c65-42d1-811d-931e23ea045f.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5000, 3006, '0ec71512-7313-4a3d-ab00-b9f5afd7c504.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5001, 3006, 'f6cbeb6b-1d05-4e54-ad1c-e0bed1380572.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5002, 3006, '20a51db6-7d5a-456a-ac2b-564680c1d173.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5003, 3006, 'b547f26c-d6ca-41df-bf12-0e9f66125eed.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5004, 3006, 'cec1583e-0ce1-4efa-bad4-f5e0354b9d46.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5005, 3006, 'a1354bff-198c-4471-90e4-01ae58103d9a.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5006, 3006, 'bc5594c3-b225-47c3-b338-13b59205807d.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5007, 3006, 'e26bf2d7-3fea-4bd7-bd8b-c550b09a0a77.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5008, 3006, '3c7f6a80-29ed-431a-9970-d9b5a17d9eed.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (5009, 3006, 'ac9a6ada-a121-4323-90a4-86ce60f0ed44.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (6000, 3006, '4ea55e5e-8234-4ffb-b2f3-b2280c78b7d9.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (6001, 3006, '03f03047-42c1-40e9-be5b-bcf23676c4c9.jpg');
INSERT INTO restaurantgalleryimages (id, idrestaurant, imagefilename) VALUES (6002, 3006, '69e451d2-12fd-4672-b763-5ecc9d24c4b3.jpg');


CREATE TABLE restaurantmenuitem(
    id bigint,
    idRestaurant bigint NOT NULL,
    type varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    price float NULL,
    description varchar(1000) NULL,
    PRIMARY KEY (id)
);


INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3001, 3001, 'Breakfast', 'Pronto Guacamole', 8, '3 oz of fresh ripe Avocados, Garlic, lime Juice, Salsa and Roma Tomatoes.');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3002, 3001, 'Breakfast', 'Smoky Queso Fundido', 4, '8 oz spicy, three pepper, cheese dip mixed with our own freshly made Salsa Roja');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3003, 3002, 'Breakfast', 'Guacamole & Chips', 4, '8 oz. of fresh ripe Avocados, Garlic, lime Juice, Salsa and Roma Tomatoes.');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3004, 3001, 'Breakfast', 'Chips & Salsa', 3, 'Fresh tortilla chips with full salsa bar hosting 6 salsas made fresh everyday.');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3005, 3001, 'Breakfast', 'Cheese Calzone', 8, 'Baked or Fried');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3006, 3001, 'Lunch', 'Tostada', 8, '8 oz. of fresh ripe Avocados, Garlic');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3007, 3001, 'Lunch', 'Baja BBQ Chicken Salad', 5, 'Cheese dip mixed with our own freshly made Salsa Roja');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3008, 3001, 'Lunch', 'Baja Ensalada', 12, '3 oz of fresh ripe Avocados, Garlic, lime Juice, Salsa and Roma Tomatoes');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3009, 3001, 'Lunch', 'Nachos', 11, '8 oz spicy, three pepper');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3010, 3001, 'Lunch', 'Quesadilla', 14, 'Served with freshly made tortilla chips.');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3011, 3001, 'Dinner', 'Fajitas', 8, '3 oz of fresh ripe Avocados, Garlic, lime Juice, Salsa and Roma Tomatoes');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3012, 3001, 'Dinner', 'Baja BBQ Chicken Salad', 5, '8 oz. of fresh ripe Avocados, Garlic');



INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3013, 3002, 'Breakfast', 'Jamaican Patties', 2, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3014, 3002, 'Breakfast', 'French Fries', 3, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3015, 3002, 'Breakfast', 'Argentine Empanadas', 2, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3016, 3002, 'Lunch', 'Grilled Chicken', 13, 'Italian House Salad or Caesar');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3017, 3002, 'Lunch', 'Homemade Chicken Salad', 7, 'Italian House or Caesar Salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3018, 3002, 'Lunch', 'Pasta Carbonaro', 14, 'With onion & Prosciutto in a cream sauce');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3019, 3002, 'Lunch', 'Mochi', 4, 'Two pieces');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3020, 3002, 'Lunch', 'King Crab', 5, 'One piece');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3021, 3002, 'Dinner', 'Tuna Salad', 9, 'Italian House or Caesar Salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3022, 3002, 'Dinner', 'Rainbow Naruto Roll', 12, 'Tuna, salmon, white fish, kani, avocado and tobiko');

INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3023, 3003, 'Breakfast', 'Meat Stromboli', 12, 'Pepperoni, Ham, Bacon, Sausage, Meatball');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3024, 3003, 'Breakfast', 'Cheese Calzone', 8, 'Baked or Fried');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3025, 3003, 'Breakfast', 'Fettuccini Alfredos', 13, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3026, 3003, 'Lunch', 'Shrimp Fra Diavolo', 19, 'Spicy Shrimp');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3027, 3003, 'Lunch', 'Veal Parmigiana', 14, 'Italian House or Caesar Salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3028, 3003, 'Lunch', 'Cheese Ravioli', 10, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3029, 3003, 'Lunch', 'Margherita', 4, 'Two pieces');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3030, 3003, 'Lunch', 'Vegetable Delight', 18, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3031, 3003, 'Dinner', 'Christians Special', 19, 'Marinara Sauce, Fresh Mozzarella, Pepperoni, Ham');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3032, 3003, 'Dinner', 'Meatlovers', 20, '5 Meats -Pepperoni, Meatball, Ham, Bacon, Sausage');


INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3033, 3005, 'Breakfast', 'White Pizza', 12, 'Pepperoni, Ham, Bacon, Sausage, Meatball');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3034, 3005, 'Breakfast', 'Penne alla Vodka Pie', 8, 'Baked or Fried');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3035, 3005, 'Breakfast', 'Eggplant Marinara Pie', 13, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3036, 3005, 'Lunch', 'Siciliana', 19, 'Spicy Shrimp');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3037, 3005, 'Lunch', 'Lasagna Pizza', 14, 'Italian House or Caesar Salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3038, 3005, 'Lunch', 'Delicious Pie', 10, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3039, 3005, 'Lunch', 'Lasagna', 4, 'Two pieces');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3040, 3005, 'Lunch', 'Philly Cheese Steak', 18, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3041, 3005, 'Dinner', 'Chicken Salad', 19, 'Marinara Sauce, Fresh Mozzarella, Pepperoni, Ham');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3042, 3003, 'Dinner', 'Grilled Marinated Chicken Sub', 20, '5 Meats -Pepperoni, Meatball, Ham, Bacon, Sausage');


INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3043, 3007, 'Breakfast', 'Meat Stromboli', 12, 'Pepperoni, Ham, Bacon, Sausage, Meatball');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3044, 3007, 'Breakfast', 'Cheese Calzone', 8, 'Baked or Fried');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3045, 3007, 'Breakfast', 'Fettuccini Alfredos', 13, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3046, 3007, 'Lunch', 'Buffalo Chicken Wrap', 19, 'Spicy Shrimp');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3047, 3007, 'Lunch', 'Veal Parmigiana', 14, 'Italian House or Caesar Salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3048, 3007, 'Lunch', 'Caesar Salad with Chicken', 10, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3049, 3007, 'Lunch', 'Margherita', 4, 'Two pieces');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3050, 3007, 'Lunch', 'Vegetable Delight', 18, '');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3051, 3007, 'Dinner', 'Cheese Steak Sub', 19, 'Marinara Sauce, Fresh Mozzarella, Pepperoni, Ham');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3052, 3003, 'Dinner', 'The New York Salad', 20, '5 Meats -Pepperoni, Meatball, Ham, Bacon, Sausage');


INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3053, 3008, 'Breakfast', 'Crazy Roll', 13, 'Spicy tuna, spicy salmon, tempura flake, tobiko and tuna');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3054, 3008, 'Breakfast', 'Red Dragon Roll', 13, 'Spicy tuna and crunch topped with pepper tuna, avocado and tobiko');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3055, 3008, 'Breakfast', 'Donkey Kong Roll', 10, 'Shrimp tempura topped with banana tempura');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3056, 3008, 'Lunch', 'Chicken Teriyaki Bento Box', 18, 'Served with tempura, shumai, a California roll, rice and soup or salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3057, 3008, 'Lunch', 'Negimaki Bento Box', 18, 'Served with tempura, shumai, a California roll, rice and soup or salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3058, 3008, 'Lunch', 'Sashimi Bento Box', 18, 'Seven pieces. Served with tempura, shumai, a California roll, rice and soup or salad');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3059, 3008, 'Lunch', 'Mochi', 4, 'Two pieces');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3060, 3008, 'Lunch', 'King Crab', 5, 'One piece');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3061, 3008, 'Dinner', 'Samurai Naruto Roll', 9, 'Black pepper tuna, avocado and scallion');
INSERT INTO restaurantmenuitem (id, idRestaurant, type, name, price, description) VALUES (3062, 3008, 'Dinner', 'Rainbow Naruto Roll', 12, 'Tuna, salmon, white fish, kani, avocado and tobiko');

CREATE TABLE userpasswordresettokens(
    id bigint,
    idUser bigint NOT NULL,
    expirationTime timestamp NOT NULL,
    tokenString varchar(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE SEQUENCE hibernate_sequence;

# --- !Downs
DROP TABLE users;
DROP TABLE restaurants;
DROP TABLE restauranttables;
DROP TABLE reservations;
DROP TABLE restaurantmenuitem;
DROP TABLE restaurantcategories;
DROP TABLE restaurantstocategories;
DROP TABLE restaurantlocations;
DROP TABLE restaurantcomments;
DROP TABLE restaurantgalleryimages;
DROP TABLE userpasswordresettokens;

DROP SEQUENCE IF EXISTS hibernate_sequence;