package io.metersphere.base.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class ProjectVersion implements Serializable {
    private String id;

    private String name;

    private String description;

    private String status;

    private Long publishTime;

    private Long startTime;

    private Long endTime;

    private Long createTime;

    private String createUser;

    private String projectId;

    private static final long serialVersionUID = 1L;
}