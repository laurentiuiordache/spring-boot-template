CREATE TABLE objectives
(
    id         INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    objective  VARCHAR(255)  NOT NULL,
    start_date DATE          NOT NULL,
    end_date   DATE          NOT NULL,
    score      DECIMAL(3, 3) NOT NULL
);

CREATE TABLE key_results
(
    id           INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    key_result   VARCHAR(255)  NOT NULL,
    start_date   DATE          NOT NULL,
    end_date     DATE          NOT NULL,
    score        DECIMAL(3, 3) NOT NULL,
    objective_id INT           NOT NULL
);

CREATE TABLE tasks
(
    id            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    key_result    VARCHAR(255)  NOT NULL,
    start_date    DATE          NOT NULL,
    end_date      DATE          NOT NULL,
    score         DECIMAL(3, 3) NOT NULL,
    key_result_id INT           NOT NULL
);

CREATE TABLE sub_tasks
(
    id         INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    key_result VARCHAR(255)  NOT NULL,
    start_date DATE          NOT NULL,
    end_date   DATE          NOT NULL,
    score      DECIMAL(3, 3) NOT NULL,
    task_id    INT           NOT NULL
);

ALTER TABLE key_results
    ADD CONSTRAINT `fk_key_results_objectives`
        FOREIGN KEY (objective_id) REFERENCES objectives (id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT;

ALTER TABLE tasks
    ADD CONSTRAINT `fk_tasks_key_results`
        FOREIGN KEY (key_result_id) REFERENCES key_results (id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT;

ALTER TABLE sub_tasks
    ADD CONSTRAINT `fk_sub_tasks_tasks`
        FOREIGN KEY (task_id) REFERENCES tasks (id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT;