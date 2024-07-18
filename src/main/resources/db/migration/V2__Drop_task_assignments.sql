-- Update tasks table to include user_id with a possibility of being NULL
ALTER TABLE tasks
    ADD COLUMN user_id BIGINT NULL,
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

-- Drop tasks_assignments table as it is no longer needed
DROP TABLE IF EXISTS tasks_assignments;