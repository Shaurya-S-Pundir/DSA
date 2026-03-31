# Write your MySQL query statement below
select t.name2 as Department, t.name1 as Employee, t.salary as Salary from(
    select e.name as name1, e.salary, d.name as name2,
    dense_rank() over (
        partition by e.departmentId
        order by e.salary desc
    ) as rn
    from Employee e
    join Department d
    on e.departmentId = d.id
) t
where rn <4 ;