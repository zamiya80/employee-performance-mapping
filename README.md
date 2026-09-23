# Employee Performance Mapping

## Objective
Develop a performance tracking system that enables managers to monitor employee progress and support data-driven performance management.

## Tools
- MySQL
- SQL
- Python
- Pandas
- Data analysis and reporting

## Dataset
The project includes **60 synthetic employees** and quarterly performance records for four quarters.

## Database Design
- `employees`: employee master data
- `performance_quarterly`: quarterly scores, targets, projects and training

The SQL files create the schema and provide reporting queries for:
- Quarterly performance
- Top-performing employees
- Department performance gaps
- Employees below target

## Run the Python analysis
From this project directory:

```bash
pip install pandas matplotlib
python src/analysis.py
```

The script creates `quarterly_performance.png`.

## Business Result
The project demonstrates how managers can identify performance gaps and target development actions. The statement that improvement areas can be addressed by **up to 10% per quarter should be treated as an illustrative improvement target**, not a measured historical result, unless supported by real company data.

