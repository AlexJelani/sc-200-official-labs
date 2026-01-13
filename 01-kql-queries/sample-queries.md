# Sample KQL Queries for SC-200 Lab 1
# These queries demonstrate the concepts covered in the Microsoft Learning lab

## Basic Queries

### 1. Search all tables for specific term
```kql
search "error"
| take 10
```

### 2. SecurityEvent table exploration
```kql
SecurityEvent
| take 10
```

### 3. Count events by EventID
```kql
SecurityEvent
| summarize count() by EventID
| order by count_ desc
```

### 4. Filter by time range
```kql
SecurityEvent
| where TimeGenerated > ago(1d)
| take 100
```

## Intermediate Queries

### 5. Logon events analysis
```kql
SecurityEvent
| where EventID == 4624
| summarize count() by Account
| order by count_ desc
```

### 6. Failed logon attempts
```kql
SecurityEvent
| where EventID == 4625
| project TimeGenerated, Account, Computer, IpAddress
| order by TimeGenerated desc
```

### 7. Join operations
```kql
SecurityEvent
| where EventID == 4624
| join kind=inner (
    SecurityEvent
    | where EventID == 4634
) on Computer
| project TimeGenerated, Account, Computer
```

## Advanced Queries

### 8. Time series analysis
```kql
SecurityEvent
| where TimeGenerated > ago(7d)
| summarize count() by bin(TimeGenerated, 1h)
| render timechart
```

### 9. Anomaly detection
```kql
SecurityEvent
| where EventID == 4625
| make-series FailedLogons=count() default=0 on TimeGenerated step 1h
| extend anomalies = series_decompose_anomalies(FailedLogons)
```

### 10. Multi-table correlation
```kql
SecurityEvent
| where EventID == 4625
| summarize FailedAttempts=count() by Computer, bin(TimeGenerated, 1h)
| join kind=inner (
    Heartbeat
    | summarize by Computer, bin(TimeGenerated, 1h)
) on Computer, TimeGenerated
| where FailedAttempts > 10
```

## Practice Exercises

1. **Basic Filtering**: Write a query to find all security events from the last 24 hours
2. **Aggregation**: Count the number of events per computer
3. **Visualization**: Create a time chart showing logon events over time
4. **Advanced**: Identify computers with unusual logon patterns