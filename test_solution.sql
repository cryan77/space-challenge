-- Test 1: Get agent rankings for a Mars-bound customer

CALL GetAgentRankings(
    'Alex Johnson',                 
    'Phone Call',                  
    'Bought',                       
    'Mars',                          
    'Dallas-Fort Worth Launch Complex' 
);

-- Test 2: Get agent rankings for a Europa-bound customer

CALL GetAgentRankings(
    'Sarah Chen',                   
    'Text',                           
    'Organic',                       
    'Europa',                        
    'New York Orbital Gateway'      
);

-- Test 3: Assign a customer to the best agent

CALL AssignCustomerToAgent(
    'Michael Rodriguez',             
    'Phone Call',                   
    'Bought',                       
    'Titan',                       
    'Dubai Interplanetary Hub'      
);

-- Test 4: Get performance report

CALL GetAgentPerformanceReport();

-- Test 5: Test scoring function for specific agents

SELECT 
    AgentID,
    CONCAT(FirstName, ' ', LastName) as AgentName,
    JobTitle,
    CalculateAgentScore(AgentID, 'Test Customer', 'Phone Call', 'Bought', 'Mars', 'Dallas-Fort Worth Launch Complex') as Score
FROM space_travel_agents 
WHERE AgentID IN (1, 6, 12, 22, 23)  
ORDER BY Score DESC;

-- Test 6: View agent performance metrics

SELECT 
    AgentID,
    CONCAT(FirstName, ' ', LastName) as AgentName,
    JobTitle,
    DepartmentName,
    YearsOfService,
    AverageCustomerServiceRating,
    TotalAssignments,
    BookingSuccessRate,
    AvgRevenuePerBooking,
    RecentAssignments
FROM agent_performance_metrics
ORDER BY AverageCustomerServiceRating DESC, BookingSuccessRate DESC
LIMIT 10;

-- Test 7: View communication preferences

SELECT 
    AgentID,
    CONCAT(sta.FirstName, ' ', sta.LastName) as AgentName,
    CommunicationMethod,
    PreferenceCount,
    PreferencePercentage
FROM agent_communication_preferences acp
JOIN space_travel_agents sta ON acp.AgentID = sta.AgentID
WHERE acp.AgentID IN (1, 6, 12, 22, 23)
ORDER BY acp.AgentID, PreferencePercentage DESC;

-- Test 8: View destination expertise

SELECT 
    AgentID,
    CONCAT(sta.FirstName, ' ', sta.LastName) as AgentName,
    Destination,
    DestinationBookings,
    SuccessRateForDestination,
    AvgRevenueForDestination
FROM agent_destination_expertise ade
JOIN space_travel_agents sta ON ade.AgentID = sta.AgentID
WHERE ade.AgentID IN (1, 6, 12, 22, 23)
ORDER BY ade.AgentID, SuccessRateForDestination DESC;

-- Test 9: Test workload balancing

SELECT 
    AgentID,
    CONCAT(FirstName, ' ', LastName) as AgentName,
    RecentAssignments,
    CASE 
        WHEN RecentAssignments = 0 THEN 'Available'
        WHEN RecentAssignments <= 2 THEN 'Light Load'
        WHEN RecentAssignments <= 5 THEN 'Moderate Load'
        ELSE 'Heavy Load'
    END as WorkloadStatus
FROM agent_performance_metrics
ORDER BY RecentAssignments ASC, AverageCustomerServiceRating DESC
LIMIT 10;

-- Test 10: Comprehensive scoring breakdown

SELECT 
    sta.AgentID,
    CONCAT(sta.FirstName, ' ', sta.LastName) as AgentName,
    sta.JobTitle,
    sta.DepartmentName,
    sta.YearsOfService,
    sta.AverageCustomerServiceRating,
    CalculateAgentScore(sta.AgentID, 'Test Customer', 'Phone Call', 'Bought', 'Mars', 'Dallas-Fort Worth Launch Complex') as TotalScore,
    ROUND(sta.AverageCustomerServiceRating * 8, 2) as RatingScore,
    ROUND(LEAST(sta.YearsOfService, 20) * 0.5, 2) as ExperienceScore,
    apm.BookingSuccessRate,
    ROUND(apm.BookingSuccessRate * 0.3, 2) as SuccessScore,
    ROUND(LEAST(apm.AvgRevenuePerBooking / 10000, 20), 2) as RevenueScore
FROM space_travel_agents sta
LEFT JOIN agent_performance_metrics apm ON sta.AgentID = apm.AgentID
WHERE sta.AgentID IN (1, 6, 12, 22, 23)
ORDER BY TotalScore DESC;