package com.linln.modules.cloud.repository;

import com.linln.modules.cloud.domain.License;
import com.linln.modules.system.repository.BaseRepository;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
public interface LicenseRepository extends BaseRepository<License, Long> {
    License findByInvitationCode(String authCode);
}