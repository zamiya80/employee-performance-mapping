import pandas as pd
import matplotlib.pyplot as plt

employees = pd.read_csv("data/employees.csv")
performance = pd.read_csv("data/performance_quarterly.csv")

df = performance.merge(employees, on="employee_id", how="left")

quarterly = df.groupby("quarter").agg(
    avg_score=("performance_score", "mean"),
    avg_target=("target_score", "mean"),
    employees=("employee_id", "nunique")
).round(2)

print("Quarterly performance:")
print(quarterly)

employee_summary = df.groupby(["employee_id", "employee_name", "department"]).agg(
    avg_score=("performance_score", "mean"),
    avg_target=("target_score", "mean"),
    total_projects=("projects_completed", "sum")
).reset_index()

employee_summary["performance_gap"] = (
    employee_summary["avg_target"] - employee_summary["avg_score"]
).round(2)

print("\nTop performers:")
print(employee_summary.sort_values("avg_score", ascending=False).head(10))

print("\nLargest performance gaps:")
print(employee_summary.sort_values("performance_gap", ascending=False).head(10))

dept = df.groupby("department").agg(
    avg_score=("performance_score", "mean"),
    avg_target=("target_score", "mean")
).round(2)

dept["gap"] = (dept["avg_target"] - dept["avg_score"]).round(2)
print("\nDepartment summary:")
print(dept)

quarterly[["avg_score", "avg_target"]].plot(
    kind="bar", title="Quarterly Performance vs Target"
)
plt.ylabel("Score")
plt.tight_layout()
plt.savefig("quarterly_performance.png", dpi=150)
plt.show()
