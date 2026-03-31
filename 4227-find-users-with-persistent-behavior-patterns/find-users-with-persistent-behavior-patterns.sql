# Write your MySQL query statement below
select * from (
    select user_id, action, count(*) as streak_length ,MIN(action_date) AS start_date,
    MAX(action_date) AS end_date
    from activity
    group by user_id ,action
    order by streak_length desc
    ) t
where streak_length > 4;