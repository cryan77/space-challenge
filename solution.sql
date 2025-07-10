
-- 1. SETUP EXISTING TABLES (if not already created)

-- Create space_travel_agents table
DROP TABLE IF EXISTS space_travel_agents;
CREATE TABLE space_travel_agents (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JobTitle VARCHAR(50),
    DepartmentName VARCHAR(50),
    ManagerName VARCHAR(100),
    SpaceLicenseNumber VARCHAR(20),
    YearsOfService INT,
    AverageCustomerServiceRating FLOAT
);

-- Create assignment_history table
DROP TABLE IF EXISTS assignment_history;
CREATE TABLE assignment_history (
    AssignmentID INT PRIMARY KEY,
    AgentID INT,
    CustomerName VARCHAR(100),
    CommunicationMethod VARCHAR(20),
    LeadSource VARCHAR(20),
    AssignedDateTime DATETIME
);

-- Create bookings table
DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    BookingID INT PRIMARY KEY,
    AssignmentID INT,
    BookingCompleteDate DATETIME,
    CancelledDate DATETIME,
    Destination VARCHAR(50),
    Package VARCHAR(100),
    LaunchLocation VARCHAR(100),
    DestinationRevenue DECIMAL(12,2),
    PackageRevenue DECIMAL(12,2),
    TotalRevenue DECIMAL(12,2),
    BookingStatus VARCHAR(20)
);

-- 2. INSERT SAMPLE DATA (from provided files)

-- Insert space travel agents data
INSERT INTO space_travel_agents VALUES
(1, 'Aurora', 'Tanaka', 'aurora.tanaka@astra2081.com', 'Senior Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-001', 12, 4.0),
(2, 'Kai', 'Rodriguez', 'kai.rodriguez@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Lyra Chen', 'SL-2081-002', 7, 4.0),
(3, 'Nova', 'Singh', 'nova.singh@astra2081.com', 'Senior Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-003', 15, 4.0),
(4, 'Leo', 'Kim', 'leo.kim@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-004', 5, 4.0),
(5, 'Vera', 'Nguyen', 'vera.nguyen@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-005', 3, 3.9),
(6, 'Soren', 'Baker', 'soren.baker@astra2081.com', 'Lead Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-006', 18, 4.6),
(7, 'Mira', 'Patel', 'mira.patel@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-007', 4, 4.5),
(8, 'Orion', 'Davis', 'orion.davis@astra2081.com', 'Senior Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-008', 10, 4.4),
(9, 'Luna', 'Martinez', 'luna.martinez@astra2081.com', 'Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-009', 6, 4.4),
(10, 'Zara', 'Khan', 'zara.khan@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Lyra Chen', 'SL-2081-010', 2, 4.0),
(11, 'Elias', 'Walker', 'elias.walker@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Lyra Chen', 'SL-2081-011', 5, 4.7),
(12, 'Nia', 'Ramirez', 'nia.ramirez@astra2081.com', 'Senior Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-012', 14, 5.0),
(13, 'Atlas', 'Foster', 'atlas.foster@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-013', 6, 4.3),
(14, 'Selene', 'Ali', 'selene.ali@astra2081.com', 'Lead Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-014', 16, 4.2),
(15, 'Rhea', 'Chen', 'rhea.chen@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-015', 4, 4.1),
(16, 'Zion', 'Parker', 'zion.parker@astra2081.com', 'Senior Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-016', 12, 4.0),
(17, 'Lyra', 'Morgan', 'lyra.morgan@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Lyra Chen', 'SL-2081-017', 3, 3.3),
(18, 'Dax', 'Reyes', 'dax.reyes@astra2081.com', 'Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-018', 8, 4.0),
(19, 'Calypso', 'White', 'calypso.white@astra2081.com', 'Senior Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-019', 11, 4.7),
(20, 'Orla', 'Patel', 'orla.patel@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-020', 2, 4.4),
(21, 'Arlo', 'Scott', 'arlo.scott@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-021', 7, 4.2),
(22, 'Juno', 'Brooks', 'juno.brooks@astra2081.com', 'Lead Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-022', 17, 4.8),
(23, 'Cassian', 'Ward', 'cassian.ward@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Lyra Chen', 'SL-2081-023', 4, 5.0),
(24, 'Phoebe', 'Diaz', 'phoebe.diaz@astra2081.com', 'Senior Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-024', 13, 4.3),
(25, 'Enzo', 'Nguyen', 'enzo.nguyen@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-025', 5, 4.4),
(26, 'Vega', 'Price', 'vega.price@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-026', 3, 3.8),
(27, 'Ronan', 'Young', 'ronan.young@astra2081.com', 'Senior Space Travel Agent', 'Premium Bookings', 'Zane Holloway', 'SL-2081-027', 15, 4.0),
(28, 'Mila', 'Reed', 'mila.reed@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-028', 6, 4.9),
(29, 'Sage', 'Cooper', 'sage.cooper@astra2081.com', 'Space Travel Agent', 'Luxury Voyages', 'Zane Holloway', 'SL-2081-029', 4, 4.3),
(30, 'Zuri', 'Bennett', 'zuri.bennett@astra2081.com', 'Space Travel Agent', 'Interplanetary Sales', 'Lyra Chen', 'SL-2081-030', 2, 3.7);

-- Insert sample assignment history (first 50 records for brevity)
INSERT INTO assignment_history VALUES
(1, 7, 'Evelyn Brooks', 'Phone Call', 'Organic', '2081-02-01 09:00:00'),
(2, 14, 'Lucas Chen', 'Text', 'Bought', '2081-02-01 10:30:00'),
(3, 3, 'Amara Patel', 'Text', 'Organic', '2081-02-01 11:15:00'),
(4, 25, 'Jasper Kim', 'Phone Call', 'Bought', '2081-02-01 13:00:00'),
(5, 7, 'Zara Singh', 'Text', 'Organic', '2081-02-01 14:20:00'),
(6, 17, 'Milo Davis', 'Phone Call', 'Bought', '2081-02-02 09:45:00'),
(7, 9, 'Aurora Ramirez', 'Text', 'Organic', '2081-02-02 10:10:00'),
(8, 14, 'Theo White', 'Phone Call', 'Organic', '2081-02-02 11:55:00'),
(9, 28, 'Isla Nguyen', 'Text', 'Bought', '2081-02-02 13:40:00'),
(10, 1, 'Rowan Scott', 'Phone Call', 'Organic', '2081-02-02 15:00:00'),
(11, 23, 'Nora Ali', 'Text', 'Bought', '2081-02-03 09:30:00'),
(12, 4, 'Kai Foster', 'Phone Call', 'Organic', '2081-02-03 10:25:00'),
(13, 19, 'Sienna Reed', 'Text', 'Bought', '2081-02-03 11:15:00'),
(14, 12, 'Elias Parker', 'Phone Call', 'Organic', '2081-02-03 13:10:00'),
(15, 5, 'Maya Brooks', 'Text', 'Organic', '2081-02-03 14:30:00'),
(16, 27, 'Leo Walker', 'Text', 'Bought', '2081-02-04 09:05:00'),
(17, 8, 'Luna Martinez', 'Phone Call', 'Organic', '2081-02-04 10:20:00'),
(18, 21, 'Asher Patel', 'Text', 'Bought', '2081-02-04 11:40:00'),
(19, 3, 'Nova Bennett', 'Text', 'Organic', '2081-02-04 13:50:00'),
(20, 11, 'Aria Cooper', 'Phone Call', 'Bought', '2081-02-04 15:10:00'),
(21, 30, 'Ethan Price', 'Text', 'Organic', '2081-02-05 09:45:00'),
(22, 2, 'Sophia Reed', 'Text', 'Bought', '2081-02-05 11:00:00'),
(23, 14, 'Jackson Young', 'Phone Call', 'Organic', '2081-02-05 12:15:00'),
(24, 6, 'Chloe Parker', 'Text', 'Organic', '2081-02-05 13:30:00'),
(25, 17, 'Owen Brooks', 'Text', 'Bought', '2081-02-05 14:50:00'),
(26, 15, 'Harper Davis', 'Phone Call', 'Organic', '2081-02-06 09:10:00'),
(27, 26, 'Mason Patel', 'Text', 'Bought', '2081-02-06 10:25:00'),
(28, 9, 'Layla Bennett', 'Text', 'Organic', '2081-02-06 11:40:00'),
(29, 29, 'Benjamin Scott', 'Phone Call', 'Organic', '2081-02-06 13:00:00'),
(30, 13, 'Ella Cooper', 'Text', 'Bought', '2081-02-06 14:30:00'),
(31, 18, 'Miles Turner', 'Text', 'Organic', '2081-02-07 09:20:00'),
(32, 24, 'Hazel Rivera', 'Phone Call', 'Bought', '2081-02-07 10:40:00'),
(33, 4, 'Gavin Clark', 'Text', 'Organic', '2081-02-07 11:55:00'),
(34, 20, 'Leah Lewis', 'Text', 'Organic', '2081-02-07 13:05:00'),
(35, 16, 'Stella Hughes', 'Phone Call', 'Bought', '2081-02-07 14:25:00'),
(36, 22, 'Nolan Adams', 'Text', 'Organic', '2081-02-08 09:35:00'),
(37, 8, 'Ayla Foster', 'Text', 'Bought', '2081-02-08 10:50:00'),
(38, 25, 'Brody West', 'Phone Call', 'Organic', '2081-02-08 12:10:00'),
(39, 10, 'Piper Scott', 'Text', 'Organic', '2081-02-08 13:25:00'),
(40, 19, 'Sawyer Reed', 'Text', 'Bought', '2081-02-08 14:50:00'),
(41, 12, 'Aurora King', 'Phone Call', 'Organic', '2081-02-09 09:45:00'),
(42, 23, 'Jonah Bell', 'Text', 'Bought', '2081-02-09 10:55:00'),
(43, 6, 'Elena Ross', 'Text', 'Organic', '2081-02-09 12:05:00'),
(44, 28, 'Caleb Price', 'Phone Call', 'Organic', '2081-02-09 13:15:00'),
(45, 1, 'Olivia Gray', 'Text', 'Bought', '2081-02-09 14:35:00'),
(46, 5, 'Wyatt Hayes', 'Text', 'Organic', '2081-02-10 09:00:00'),
(47, 13, 'Violet Cox', 'Phone Call', 'Bought', '2081-02-10 10:15:00'),
(48, 30, 'Harrison Lee', 'Text', 'Organic', '2081-02-10 11:25:00'),
(49, 27, 'Ruby Rivera', 'Text', 'Organic', '2081-02-10 12:40:00'),
(50, 15, 'Declan Cruz', 'Phone Call', 'Bought', '2081-02-10 14:00:00');

-- Insert sample bookings data (first 50 records for brevity)
INSERT INTO bookings VALUES
(1, 1, '2081-02-01 10:00:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Confirmed'),
(2, 2, NULL, '2081-02-01 11:00:00', 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Cancelled'),
(3, 4, '2081-02-01 13:30:00', NULL, 'Titan', 'Ringside Cruise', 'Dubai Interplanetary Hub', 140000, 30000, 170000, 'Confirmed'),
(4, 5, NULL, '2081-02-01 15:10:00', 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Cancelled'),
(5, 6, '2081-02-02 10:00:00', NULL, 'Venus', 'Cloud City Excursion', 'Tokyo Spaceport Terminal', 130000, 25000, 155000, 'Confirmed'),
(6, 8, '2081-02-02 12:00:00', NULL, 'Mars', 'Luxury Dome Stay', 'New York Orbital Gateway', 150000, 30000, 180000, 'Confirmed'),
(7, 9, NULL, NULL, 'Europa', 'Glacier Trek Adventure', 'London Ascension Platform', 125000, 20000, 145000, 'Pending'),
(8, 10, '2081-02-02 15:30:00', NULL, 'Ganymede', 'Private Observatory Suite', 'Sydney Stellar Port', 110000, 15000, 125000, 'Confirmed'),
(9, 11, NULL, '2081-02-03 10:00:00', 'Titan', 'Ringside Cruise', 'Dubai Interplanetary Hub', 140000, 25000, 165000, 'Cancelled'),
(10, 13, '2081-02-03 11:30:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Confirmed'),
(11, 14, NULL, '2081-02-03 13:30:00', 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Cancelled'),
(12, 15, '2081-02-03 14:45:00', NULL, 'Venus', 'Cloud City Excursion', 'Tokyo Spaceport Terminal', 130000, 30000, 160000, 'Confirmed'),
(13, 16, '2081-02-04 09:30:00', NULL, 'Ganymede', 'Private Observatory Suite', 'Dubai Interplanetary Hub', 110000, 20000, 130000, 'Confirmed'),
(14, 18, NULL, '2081-02-04 12:00:00', 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Cancelled'),
(15, 20, NULL, '2081-02-04 15:20:00', 'Europa', 'Glacier Trek Adventure', 'London Ascension Platform', 125000, 20000, 145000, 'Cancelled'),
(16, 21, '2081-02-05 10:00:00', NULL, 'Titan', 'Ringside Cruise', 'New York Orbital Gateway', 140000, 30000, 170000, 'Confirmed'),
(17, 22, '2081-02-05 11:20:00', NULL, 'Mars', 'Luxury Dome Stay', 'Tokyo Spaceport Terminal', 150000, 25000, 175000, 'Confirmed'),
(18, 24, '2081-02-05 13:40:00', NULL, 'Europa', 'Zero-Gravity Yacht Cruise', 'Dallas-Fort Worth Launch Complex', 120000, 15000, 135000, 'Confirmed'),
(19, 25, NULL, '2081-02-05 15:10:00', 'Venus', 'Cloud City Excursion', 'New York Orbital Gateway', 130000, 20000, 150000, 'Cancelled'),
(20, 26, NULL, NULL, 'Ganymede', 'Private Observatory Suite', 'Dubai Interplanetary Hub', 110000, 25000, 135000, 'Pending'),
(21, 27, '2081-02-06 10:45:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Confirmed'),
(22, 29, '2081-02-06 13:10:00', NULL, 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Confirmed'),
(23, 30, NULL, '2081-02-06 14:45:00', 'Titan', 'Ringside Cruise', 'Tokyo Spaceport Terminal', 140000, 30000, 170000, 'Cancelled'),
(24, 31, '2081-02-07 09:45:00', NULL, 'Venus', 'Cloud City Excursion', 'London Ascension Platform', 130000, 25000, 155000, 'Confirmed'),
(25, 33, '2081-02-07 12:00:00', NULL, 'Ganymede', 'Private Observatory Suite', 'Dubai Interplanetary Hub', 110000, 15000, 125000, 'Confirmed'),
(26, 34, NULL, '2081-02-07 13:30:00', 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Cancelled'),
(27, 35, NULL, '2081-02-07 14:50:00', 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 30000, 180000, 'Cancelled'),
(28, 36, '2081-02-08 09:50:00', NULL, 'Titan', 'Ringside Cruise', 'Tokyo Spaceport Terminal', 140000, 20000, 160000, 'Confirmed'),
(29, 37, NULL, NULL, 'Europa', 'Glacier Trek Adventure', 'Dubai Interplanetary Hub', 125000, 25000, 150000, 'Pending'),
(30, 39, '2081-02-08 13:45:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Confirmed'),
(31, 40, '2081-02-08 15:00:00', NULL, 'Ganymede', 'Private Observatory Suite', 'New York Orbital Gateway', 110000, 20000, 130000, 'Confirmed'),
(32, 41, '2081-02-09 10:00:00', NULL, 'Venus', 'Cloud City Excursion', 'Tokyo Spaceport Terminal', 130000, 30000, 160000, 'Confirmed'),
(33, 42, NULL, '2081-02-09 11:30:00', 'Europa', 'Zero-Gravity Yacht Cruise', 'Dubai Interplanetary Hub', 120000, 20000, 140000, 'Cancelled'),
(34, 44, '2081-02-09 13:30:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 30000, 180000, 'Confirmed'),
(35, 45, '2081-02-09 14:45:00', NULL, 'Titan', 'Ringside Cruise', 'New York Orbital Gateway', 140000, 25000, 165000, 'Confirmed'),
(36, 51, '2081-02-11 09:30:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 150000, 25000, 175000, 'Confirmed'),
(37, 52, '2081-02-11 10:45:00', NULL, 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Confirmed'),
(38, 53, NULL, '2081-02-11 11:45:00', 'Venus', 'Cloud City Excursion', 'Dubai Interplanetary Hub', 130000, 25000, 155000, 'Cancelled'),
(39, 54, '2081-02-11 13:10:00', NULL, 'Titan', 'Ringside Cruise', 'London Ascension Platform', 140000, 30000, 170000, 'Confirmed'),
(40, 55, '2081-02-11 14:30:00', NULL, 'Mars', 'Luxury Dome Stay', 'Dallas-Fort Worth Launch Complex', 100000, 0, 100000, 'Confirmed'),
(41, 57, '2081-02-11 16:50:00', NULL, 'Europa', 'Zero-Gravity Yacht Cruise', 'New York Orbital Gateway', 120000, 20000, 140000, 'Confirmed'),
(42, 58, '2081-02-12 09:30:00', NULL, 'Venus', 'Cloud City Excursion', 'Tokyo Spaceport Terminal', 130000, 25000, 155000, 'Confirmed'),
(43, 59, NULL, '2081-02-12 10:45:00', 'Mars', 'Luxury Dome Stay', 'Dubai Interplanetary Hub', 150000, 25000, 175000, 'Cancelled'),
(44, 60, '2081-02-12 12:00:00', NULL, 'Titan', 'Ringside Cruise', 'Dallas-Fort Worth Launch Complex', 140000, 20000, 160000, 'Confirmed'),
(45, 62, '2081-02-12 14:30:00', NULL, 'Ganymede', 'Private Observatory Suite', 'New York Orbital Gateway', 110000, 20000, 130000, 'Confirmed'),
(46, 63, '2081-02-12 15:45:00', NULL, 'Europa', 'Zero-Gravity Yacht Cruise', 'Tokyo Spaceport Terminal', 120000, 15000, 135000, 'Confirmed'),
(47, 64, '2081-02-13 09:20:00', NULL, 'Venus', 'Cloud City Excursion', 'London Ascension Platform', 130000, 30000, 160000, 'Confirmed'),
(48, 65, NULL, '2081-02-13 10:40:00', 'Mars', 'Luxury Dome Stay', 'Dubai Interplanetary Hub', 150000, 25000, 175000, 'Cancelled'),
(49, 66, '2081-02-13 12:00:00', NULL, 'Titan', 'Ringside Cruise', 'Dallas-Fort Worth Launch Complex', 140000, 20000, 160000, 'Confirmed'),
(50, 67, '2081-02-13 13:10:00', NULL, 'Europa', 'Glacier Trek Adventure', 'New York Orbital Gateway', 125000, 20000, 145000, 'Confirmed');

-- 3. CREATE SUPPORTING VIEWS AND FUNCTIONS

-- Create view for agent performance metrics
CREATE OR REPLACE VIEW agent_performance_metrics AS
SELECT 
    sta.AgentID,
    sta.FirstName,
    sta.LastName,
    sta.JobTitle,
    sta.DepartmentName,
    sta.YearsOfService,
    sta.AverageCustomerServiceRating,
    COUNT(ah.AssignmentID) as TotalAssignments,
    COUNT(b.BookingID) as TotalBookings,
    COUNT(CASE WHEN b.BookingStatus = 'Confirmed' THEN 1 END) as ConfirmedBookings,
    ROUND(COUNT(CASE WHEN b.BookingStatus = 'Confirmed' THEN 1 END) * 100.0 / NULLIF(COUNT(b.BookingID), 0), 2) as BookingSuccessRate,
    ROUND(AVG(b.TotalRevenue), 2) as AvgRevenuePerBooking,
    COUNT(CASE WHEN ah.AssignedDateTime >= DATE_SUB(NOW(), INTERVAL 7 DAY) THEN 1 END) as RecentAssignments
FROM space_travel_agents sta
LEFT JOIN assignment_history ah ON sta.AgentID = ah.AgentID
LEFT JOIN bookings b ON ah.AssignmentID = b.AssignmentID
GROUP BY sta.AgentID, sta.FirstName, sta.LastName, sta.JobTitle, sta.DepartmentName, sta.YearsOfService, sta.AverageCustomerServiceRating;

-- Create view for agent communication preferences
CREATE OR REPLACE VIEW agent_communication_preferences AS
SELECT 
    AgentID,
    CommunicationMethod,
    COUNT(*) as PreferenceCount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY AgentID), 2) as PreferencePercentage
FROM assignment_history
GROUP BY AgentID, CommunicationMethod;

-- Create view for agent destination expertise
CREATE OR REPLACE VIEW agent_destination_expertise AS
SELECT 
    ah.AgentID,
    b.Destination,
    COUNT(*) as DestinationBookings,
    ROUND(AVG(b.TotalRevenue), 2) as AvgRevenueForDestination,
    ROUND(COUNT(CASE WHEN b.BookingStatus = 'Confirmed' THEN 1 END) * 100.0 / COUNT(*), 2) as SuccessRateForDestination
FROM assignment_history ah
JOIN bookings b ON ah.AssignmentID = b.AssignmentID
WHERE b.Destination IS NOT NULL
GROUP BY ah.AgentID, b.Destination;

-- Create view for agent launch location experience
CREATE OR REPLACE VIEW agent_launch_location_experience AS
SELECT 
    ah.AgentID,
    b.LaunchLocation,
    COUNT(*) as LocationBookings,
    ROUND(AVG(b.TotalRevenue), 2) as AvgRevenueForLocation,
    ROUND(COUNT(CASE WHEN b.BookingStatus = 'Confirmed' THEN 1 END) * 100.0 / COUNT(*), 2) as SuccessRateForLocation
FROM assignment_history ah
JOIN bookings b ON ah.AssignmentID = b.AssignmentID
WHERE b.LaunchLocation IS NOT NULL
GROUP BY ah.AgentID, b.LaunchLocation;

-- 4. CREATE THE MAIN ASSIGNMENT FUNCTION

DELIMITER //

CREATE FUNCTION CalculateAgentScore(
    p_AgentID INT,
    p_CustomerName VARCHAR(100),
    p_CommunicationMethod VARCHAR(20),
    p_LeadSource VARCHAR(20),
    p_Destination VARCHAR(50),
    p_LaunchLocation VARCHAR(100)
) RETURNS DECIMAL(10,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_performance_score DECIMAL(10,2) DEFAULT 0;
    DECLARE v_compatibility_score DECIMAL(10,2) DEFAULT 0;
    DECLARE v_workload_score DECIMAL(10,2) DEFAULT 0;
    DECLARE v_specialization_score DECIMAL(10,2) DEFAULT 0;
    DECLARE v_total_score DECIMAL(10,2) DEFAULT 0;
    
    SELECT 
        (apm.AverageCustomerServiceRating * 8) +  
        (LEAST(apm.YearsOfService, 20) * 0.5) +  
        (apm.BookingSuccessRate * 0.3) +         
        (LEAST(apm.AvgRevenuePerBooking / 10000, 20)) 
    INTO v_performance_score
    FROM agent_performance_metrics apm
    WHERE apm.AgentID = p_AgentID;
    
    SELECT COALESCE(acp.PreferencePercentage, 0) * 0.15
    INTO v_compatibility_score
    FROM agent_communication_preferences acp
    WHERE acp.AgentID = p_AgentID AND acp.CommunicationMethod = p_CommunicationMethod;
    
    SELECT COALESCE(ade.SuccessRateForDestination, 0) * 0.1
    INTO v_compatibility_score
    FROM agent_destination_expertise ade
    WHERE ade.AgentID = p_AgentID AND ade.Destination = p_Destination;
    
    SELECT COALESCE(ale.SuccessRateForLocation, 0) * 0.1
    INTO v_compatibility_score
    FROM agent_launch_location_experience ale
    WHERE ale.AgentID = p_AgentID AND ale.LaunchLocation = p_LaunchLocation;
    
    SELECT (20 - LEAST(apm.RecentAssignments, 20)) * 0.75
    INTO v_workload_score
    FROM agent_performance_metrics apm
    WHERE apm.AgentID = p_AgentID;
    
    SELECT 
        CASE 
            WHEN sta.JobTitle LIKE '%Senior%' OR sta.JobTitle LIKE '%Lead%' THEN 5
            WHEN sta.JobTitle LIKE '%Agent%' THEN 3
            ELSE 2
        END +
        CASE 
            WHEN sta.DepartmentName = 'Premium Bookings' AND p_LeadSource = 'Bought' THEN 3
            WHEN sta.DepartmentName = 'Luxury Voyages' AND p_LeadSource = 'Organic' THEN 2
            ELSE 1
        END
    INTO v_specialization_score
    FROM space_travel_agents sta
    WHERE sta.AgentID = p_AgentID;
    
    SET v_total_score = 
        (v_performance_score * 0.40) +
        (v_compatibility_score * 0.35) +
        (v_workload_score * 0.15) +
        (v_specialization_score * 0.10);
    
    RETURN LEAST(v_total_score, 100); 
END //

DELIMITER ;

-- 5. CREATE THE MAIN ASSIGNMENT PROCEDURE

DELIMITER //

CREATE PROCEDURE AssignCustomerToAgent(
    IN p_CustomerName VARCHAR(100),
    IN p_CommunicationMethod VARCHAR(20),
    IN p_LeadSource VARCHAR(20),
    IN p_Destination VARCHAR(50),
    IN p_LaunchLocation VARCHAR(100)
)
BEGIN
    DECLARE v_next_assignment_id INT;
    DECLARE v_best_agent_id INT;
    DECLARE v_best_score DECIMAL(10,2);
    
    SELECT COALESCE(MAX(AssignmentID), 0) + 1 INTO v_next_assignment_id FROM assignment_history;
    
    SELECT 
        sta.AgentID,
        CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) as Score
    INTO v_best_agent_id, v_best_score
    FROM space_travel_agents sta
    ORDER BY Score DESC
    LIMIT 1;
    
    INSERT INTO assignment_history (AssignmentID, AgentID, CustomerName, CommunicationMethod, LeadSource, AssignedDateTime)
    VALUES (v_next_assignment_id, v_best_agent_id, p_CustomerName, p_CommunicationMethod, p_LeadSource, NOW());
    
    SELECT 
        v_next_assignment_id as AssignmentID,
        v_best_agent_id as AgentID,
        CONCAT(sta.FirstName, ' ', sta.LastName) as AgentName,
        sta.JobTitle,
        sta.DepartmentName,
        v_best_score as AssignmentScore,
        p_CustomerName as CustomerName,
        p_CommunicationMethod as CommunicationMethod,
        p_LeadSource as LeadSource,
        p_Destination as Destination,
        p_LaunchLocation as LaunchLocation,
        NOW() as AssignedDateTime
    FROM space_travel_agents sta
    WHERE sta.AgentID = v_best_agent_id;
    
END //

DELIMITER ;

-- 6. CREATE THE RANKING PROCEDURE

DELIMITER //

CREATE PROCEDURE GetAgentRankings(
    IN p_CustomerName VARCHAR(100),
    IN p_CommunicationMethod VARCHAR(20),
    IN p_LeadSource VARCHAR(20),
    IN p_Destination VARCHAR(50),
    IN p_LaunchLocation VARCHAR(100)
)
BEGIN
    SELECT 
        sta.AgentID,
        CONCAT(sta.FirstName, ' ', sta.LastName) as AgentName,
        sta.JobTitle,
        sta.DepartmentName,
        sta.YearsOfService,
        sta.AverageCustomerServiceRating,
        CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) as TotalScore,
        ROUND(CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) * 0.40, 2) as PerformanceScore,
        ROUND(CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) * 0.35, 2) as CompatibilityScore,
        ROUND(CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) * 0.15, 2) as WorkloadScore,
        ROUND(CalculateAgentScore(sta.AgentID, p_CustomerName, p_CommunicationMethod, p_LeadSource, p_Destination, p_LaunchLocation) * 0.10, 2) as SpecializationScore
    FROM space_travel_agents sta
    ORDER BY TotalScore DESC;
END //

DELIMITER ;

-- 7. CREATE PERFORMANCE TRACKING PROCEDURES

DELIMITER //

CREATE PROCEDURE GetAgentPerformanceReport()
BEGIN
    SELECT 
        apm.AgentID,
        CONCAT(apm.FirstName, ' ', apm.LastName) as AgentName,
        apm.JobTitle,
        apm.DepartmentName,
        apm.YearsOfService,
        apm.AverageCustomerServiceRating,
        apm.TotalAssignments,
        apm.TotalBookings,
        apm.ConfirmedBookings,
        apm.BookingSuccessRate,
        apm.AvgRevenuePerBooking,
        apm.RecentAssignments,
        ROUND(apm.AvgRevenuePerBooking * apm.ConfirmedBookings, 2) as TotalRevenueGenerated
    FROM agent_performance_metrics apm
    ORDER BY apm.AverageCustomerServiceRating DESC, apm.BookingSuccessRate DESC;
END //

DELIMITER ;
