CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
        with tbl as(
        select id,salary,
        dense_rank() over(order by salary desc) as rnk
        from employee
        )

        select max(salary) as SecondHighestSalary
        from tbl
        where rnk=N

  );
END