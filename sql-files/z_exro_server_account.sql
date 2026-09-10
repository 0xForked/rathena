-- eXRo (PLAN-015 / Phase 2a): move the inter-server account off the world-known
-- s1/p1 default. Runs after main.sql on a fresh DB (docker-entrypoint-initdb.d,
-- alphabetical). Must match `userid`/`passwd` in
-- rathena/tools/docker/asset/{char,map}_conf.txt.
--
-- These are DEV credentials (same status as ragnarok/ragnarok for the DB user).
-- For a real deployment, rotate them here AND in a non-committed conf override
-- (see DEPLOY.md) and never commit the production value.

UPDATE `login`
   SET `userid` = 'exro_srv', `user_pass` = 'exro_dev'
 WHERE `account_id` = 1 AND `sex` = 'S';
