CREATE TABLE IF NOT EXISTS users
(
    id        BIGSERIAL PRIMARY KEY,
    name      VARCHAR(255) NOT NULL,
    email     VARCHAR(255) NOT NULL,
    companyId BIGINT
    );

CREATE TABLE IF NOT EXISTS boards
(
    id         BIGSERIAL PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    owner_id   BIGINT       NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES users (id)
    );

CREATE TABLE IF NOT EXISTS lanes
(
    id             BIGSERIAL PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    board_id       BIGINT       NOT NULL,
    order_in_board INT          NOT NULL,
    CONSTRAINT fk_board FOREIGN KEY (board_id) REFERENCES boards (id) ON DELETE CASCADE,
    CONSTRAINT uq_title_board UNIQUE (title, board_id)
    );

CREATE TABLE IF NOT EXISTS tasks
(
    id          BIGSERIAL PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    description TEXT,
    due_date    TIMESTAMP,
    status      VARCHAR(100) DEFAULT 'PENDING',
    lane_id     BIGINT       NOT NULL,
    created_at  TIMESTAMP    DEFAULT now(),
    CONSTRAINT fk_lane FOREIGN KEY (lane_id) REFERENCES lanes (id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS tasks_assignments
(
    task_id       BIGINT NOT NULL,
    user_id       BIGINT NOT NULL,
    assigned_date TIMESTAMP DEFAULT now(),
    PRIMARY KEY (task_id, user_id),
    CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    );


