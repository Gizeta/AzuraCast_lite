FROM ghcr.io/azuracast/azuracast:0.19.3

# disable cronjob
RUN sed -i -e '/CheckFolderPlaylistsTask::class/d' \
    -e '/CheckMediaTask::class/d' \
    -e '/CheckUpdatesTask::class/d' \
    -e '/CleanupRelaysTask::class/d' \
    -e '/CleanupStorageTask::class/d' \
    -e '/EnforceBroadcastTimesTask::class/d' \
    -e '/MoveBroadcastsTask::class/d' \
    -e '/RenewAcmeCertTask::class/d' \
    -e '/RunBackupTask::class/d' \
    -e '/UpdateGeoLiteTask::class/d' \
    -e '/UpdateStorageLocationSizesTask::class/d' /var/azuracast/www/config/events.php

# disable sftpgo
RUN sed -i -e '/sftpgo/d' /var/azuracast/www/src/Service/ServiceControl.php && \
    rm /etc/supervisor/full.conf.d/sftpgo.conf
