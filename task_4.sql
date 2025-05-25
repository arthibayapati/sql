-- Task 4: Backup and Recovery (PostgreSQL)
-- These are shell commands, not SQL:

-- Backup:
-- pg_dump -U postgres -F c -b -v -f /backups/mydb.backup mydb

-- Restore:
-- pg_restore -U postgres -d mydb_restored -v /backups/mydb.backup
