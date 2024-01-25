CREATE DATABASE operation_analysis;

USE operation_analysis;

CREATE TABLE job_data
(
    ds DATE,
    job_id INT NOT NULL,
    actor_id INT NOT NULL,
    event VARCHAR(15) NOT NULL,
    language VARCHAR(15) NOT NULL,
    time_spent INT NOT NULL,
    org CHAR(2)
);

INSERT INTO job_data (ds, job_id, actor_id, event, language, time_spent, org)
VALUES ('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
    ('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
    ('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
    ('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),
    ('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
    ('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
    ('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
    ('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C');
    

/* Number of jobs reviewed: Amount of jobs reviewed over time.
 Calculate the number of jobs reviewed per hour per day for November 2020  */
select ds,count(job_id) as jobs_per_day, sum(time_spent)/3600 as hours_spent 
from job_data  
where ds >='2020-11-01'  and ds <='2020-11-30'  
group by ds ;
    
    
/* Percentage share of each language: Share of each language for different contents.
 Calculate the percentage share of each language in the last 30 days */
select language as Language, count(*) * 100.0 / (select count(*) from job_data) as Percentage
from job_data
group by language;
    
/* Duplicate rows: Rows that have the same value present in them.
 Display duplicates from the table */
 SELECT * FROM job_data
GROUP BY job_id,actor_id
HAVING COUNT(*) > 1;


    
    
    