-- version
CREATE TABLE IF NOT EXISTS `project_version`
(
    `id`           varchar(50) NOT NULL,
    `project_id`   varchar(50)  DEFAULT NULL,
    `name`         varchar(100) DEFAULT NULL,
    `description`  varchar(200) DEFAULT NULL,
    `status`       varchar(20)  DEFAULT NULL,
    `publish_time` bigint(13)   DEFAULT NULL,
    `start_time`   bigint(13)   DEFAULT NULL,
    `end_time`     bigint(13)   DEFAULT NULL,
    `create_time`  bigint(13)   DEFAULT NULL,
    `create_user`  varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

INSERT INTO project_version (id, name, description, status, publish_time, start_time, end_time, create_time,
                             create_user, project_id)
SELECT UUID(),
       'v1.0.0',
       '系统默认版本',
       'open',
       UNIX_TIMESTAMP() * 1000,
       UNIX_TIMESTAMP() * 1000,
       UNIX_TIMESTAMP() * 1000,
       UNIX_TIMESTAMP() * 1000,
       'admin',
       id
FROM project;

-- enable version manage
INSERT INTO system_parameter (param_key, param_value, type, sort)
VALUES ('project.version.enable', 'true', 'text', 2);

-- api definition
ALTER TABLE api_definition
    ADD version VARCHAR(50) NULL;

ALTER TABLE api_definition
    ADD ref_id VARCHAR(50) NULL;


CREATE INDEX api_definition_ref_id_index
    ON api_definition(ref_id);

UPDATE api_definition
SET ref_id = id;

UPDATE api_definition
    INNER JOIN project_version ON project_version.project_id = api_definition.project_id
SET version = project_version.id;

