package io.metersphere.base.mapper.ext;

import io.metersphere.controller.request.ProjectVersionRequest;
import io.metersphere.dto.ProjectVersionDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExtProjectVersionMapper {
    List<ProjectVersionDTO> selectProjectVersionList(@Param("request") ProjectVersionRequest request);
}
