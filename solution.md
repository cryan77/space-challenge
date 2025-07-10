## Model Overview

The solution uses a sophisticated scoring system with four main components:

### 1. Agent Performance Metrics (40% weight)
- **Customer Service Rating**: 0-40 points based on average rating (0-5 scale)
- **Years of Service**: 0-10 points for experience (capped at 20 years)
- **Booking Success Rate**: 0-30 points based on confirmed vs total bookings
- **Average Revenue**: 0-20 points based on revenue per booking

### 2. Customer-Agent Compatibility (35% weight)
- **Communication Method Matching**: 15% weight for preferred communication style
- **Destination Expertise**: 10% weight for agent's success rate with specific destinations
- **Launch Location Experience**: 10% weight for agent's familiarity with launch locations

### 3. Workload Balancing (15% weight)
- **Recent Assignment Frequency**: Penalizes agents with too many recent assignments
- **Availability Score**: Rewards agents with lighter recent workloads

### 4. Specialization Bonus (10% weight)
- **Job Title Seniority**: Bonus points for Senior/Lead agents
- **Department Alignment**: Matches department expertise with customer needs
- **Lead Source Optimization**: Aligns agent specialties with lead sources

## Scoring Breakdown

### Performance Score (40%)
```
Rating Points = AverageCustomerServiceRating × 8
Experience Points = MIN(YearsOfService, 20) × 0.5
Success Points = BookingSuccessRate × 0.3
Revenue Points = MIN(AvgRevenuePerBooking / 10000, 20)
```

### Compatibility Score (35%)
```
Communication = PreferencePercentage × 0.15
Destination = SuccessRateForDestination × 0.10
Location = SuccessRateForLocation × 0.10
```

### Workload Score (15%)
```
WorkloadScore = (20 - MIN(RecentAssignments, 20)) × 0.75
```

### Specialization Score (10%)
```
Seniority = JobTitle Bonus (2-5 points)
Department = Department-LeadSource Alignment (1-3 points)
```

## Technical Implementation

### Database Structure

The solution includes three main tables:

1. **space_travel_agents**: Agent profiles and performance metrics
2. **assignment_history**: Historical customer-agent assignments
3. **bookings**: Booking details and revenue data

### Key Components

#### Views for Data Analysis
- `agent_performance_metrics`: Calculates performance statistics
- `agent_communication_preferences`: Analyzes communication patterns
- `agent_destination_expertise`: Tracks destination-specific success rates
- `agent_launch_location_experience`: Monitors location-specific performance

#### Core Functions
- `CalculateAgentScore()`: Main scoring algorithm
- `AssignCustomerToAgent()`: Assignment procedure
- `GetAgentRankings()`: Ranking procedure
- `GetAgentPerformanceReport()`: Performance tracking

## Usage Examples

### 1. Get Agent Rankings for a Customer

```sql
CALL GetAgentRankings(
    'John Smith',                    
    'Phone Call',                 
    'Bought',                      
    'Mars',                       
    'Dallas-Fort Worth Launch Complex' 
);
```

This returns a stack-ranked list of all agents ordered from best to worst match.

### 2. Assign Customer to Best Agent

```sql
CALL AssignCustomerToAgent(
    'Jane Doe',                
    'Text',                     
    'Organic',                   
    'Europa',                      
    'New York Orbital Gateway'    
);
```

This automatically assigns the customer to the highest-scoring agent and returns assignment details.

### 3. Performance Monitoring

```sql
CALL GetAgentPerformanceReport();
```