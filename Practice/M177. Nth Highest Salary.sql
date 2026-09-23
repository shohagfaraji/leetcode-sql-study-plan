-- Problem: Nth Highest Salary
-- R.Beats: 85.83%

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;

    RETURN (
        # Write your MySQL query statement below.
        
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        limit N, 1
    );
END