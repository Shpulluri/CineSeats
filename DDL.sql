-- Theatre table
CREATE TABLE Theatre (
    tid INT PRIMARY KEY,
    tname VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Movie table
CREATE TABLE Movie (
    movie_name VARCHAR(255) PRIMARY KEY,
    release_date DATE NOT NULL,
    description TEXT,
    rating VARCHAR(10),
    language VARCHAR(50),
    actor VARCHAR(100),
    actress VARCHAR(100),
    director VARCHAR(100),
    producer VARCHAR(100),
    music_director VARCHAR(100),
    DOP VARCHAR(100) 
);

-- Customer table
CREATE TABLE Customer (
    c_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email_id VARCHAR(100) UNIQUE NOT NULL,
    phone_no1 VARCHAR(20),
    phone_no2 VARCHAR(20)
);

-- Movie_Show table
CREATE TABLE Movie_Show (
    show_id INT PRIMARY KEY,
    tid INT,
    Screen_no INT NOT NULL,
    show_starttime TIME NOT NULL,
    show_endtime TIME NOT NULL,
    movie_name VARCHAR(255),
    FOREIGN KEY (tid) REFERENCES Theatre(tid),
    FOREIGN KEY (movie_name) REFERENCES Movie(movie_name)
);

-- Ticket table
CREATE TABLE Ticket (
    Ticket_no SERIAL PRIMARY KEY,
    c_id INT,
    seat_no1 INT NOT NULL,
    seat_no2 INT,
    seat_no3 INT,
    seat_no4 INT,
    seat_no5 INT,
    price DECIMAL(10, 2) NOT NULL,
    show_date DATE NOT NULL,
    show_id INT,
    FOREIGN KEY (c_id) REFERENCES Customer(c_id),
    FOREIGN KEY (show_id) REFERENCES Movie_Show(show_id)
);

-- Discount table
CREATE TABLE Discount (
    offer_id INT PRIMARY KEY,
    discount_amt DECIMAL(10, 2) NOT NULL
);

-- Ticket_Discount Table
CREATE TABLE Ticket_Discount (
    ticket_no INT,
    offer_id INT,
    PRIMARY KEY (ticket_no, offer_id),
    FOREIGN KEY (ticket_no) REFERENCES Ticket(ticket_no),
    FOREIGN KEY (offer_id) REFERENCES Discount(offer_id)
);
