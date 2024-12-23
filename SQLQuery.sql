
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE Cars (
    CarID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Description TEXT,
    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE Listings (
    ListingID INT PRIMARY KEY IDENTITY,
    CarID INT FOREIGN KEY REFERENCES Cars(CarID),
    ListingType VARCHAR(20) CHECK (ListingType IN ('Sale', 'Exchange')),
    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE Messages (
    MessageID INT PRIMARY KEY IDENTITY,
    ListingID INT FOREIGN KEY REFERENCES Listings(ListingID),
    SenderID INT FOREIGN KEY REFERENCES Users(UserID),
    RecipientID INT FOREIGN KEY REFERENCES Users(UserID),
    MessageText TEXT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);



INSERT INTO Users (Username, PasswordHash, Email, Phone) 
VALUES 
('user1', 'hashed_password_1', 'user1@example.com', '1234567890'),
('user2', 'hashed_password_2', 'user2@example.com', '0987654321');


INSERT INTO Cars (User ID, Make, Model, Year, Price, Description)
VALUES 
(1, 'Toyota', 'Camry', 2020, 25000.00, 'Excellent condition, low mileage.'),
(2, 'Honda', 'Civic', 2019, 20000.00, 'Well maintained, great fuel economy.');


INSERT INTO Listings (CarID, ListingType) VALUES 
(1, 'Sale'),
(2, 'Exchange');


INSERT INTO Messages (ListingID, SenderID, RecipientID, MessageText) VALUES 
(1, 2, 1, 'Hello, is the Camry still available?');
