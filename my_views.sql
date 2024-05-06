-- Vue 1: ALL_WORKERS
CREATE OR REPLACE VIEW ALL_WORKERS AS
SELECT last_name, first_name, age, start_date
FROM WORKERS_FACTORY_1
UNION ALL
SELECT last_name, first_name, age, start_date
FROM WORKERS_FACTORY_2
ORDER BY start_date DESC;

-- Vue 2: ALL_WORKERS_ELAPSED
CREATE OR REPLACE VIEW ALL_WORKERS_ELAPSED AS
SELECT last_name, first_name, age, start_date, 
       ROUND(sysdate - start_date) AS days_elapsed
FROM ALL_WORKERS;

-- Vue 3: BEST_SUPPLIERS
CREATE OR REPLACE VIEW BEST_SUPPLIERS AS
SELECT name, COUNT(*) AS parts_delivered
FROM SUPPLIERS_BRING_TO_FACTORY_1
GROUP BY name
HAVING COUNT(*) > 1000
ORDER BY parts_delivered DESC;

-- Vue 4: ROBOTS_FACTORIES
CREATE OR REPLACE VIEW ROBOTS_FACTORIES AS
SELECT R.id AS robot_id, F.main_location AS factory_location
FROM ROBOTS R
JOIN ROBOTS_FROM_FACTORY RF ON R.id = RF.robot_id
JOIN FACTORIES F ON RF.factory_id = F.id;
