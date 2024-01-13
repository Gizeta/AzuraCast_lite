FROM ghcr.io/azuracast/azuracast:0.19.3

# disable cronjob
RUN sed -i -e '/CheckFolderPlaylistsTask::class/d' \
    -e '/CheckMediaTask::class/d' \
    -e '/CheckRequestsTask::class/d' \
    -e '/CheckUpdatesTask::class/d' \
    -e '/CleanupHistoryTask::class/d' \
    -e '/CleanupRelaysTask::class/d' \
    -e '/CleanupStorageTask::class/d' \
    -e '/EnforceBroadcastTimesTask::class/d' \
    -e '/MoveBroadcastsTask::class/d' \
    -e '/QueueInterruptingTracks::class/d' \
    -e '/RenewAcmeCertTask::class/d' \
    -e '/RunBackupTask::class/d' \
    -e '/SendTimeOnSocketTask::class/d' \
    -e '/UpdateGeoLiteTask::class/d' \
    -e '/UpdateStorageLocationSizesTask::class/d' /var/azuracast/www/config/events.php

# disable sftpgo
RUN sed -i -e '/sftpgo/d' /var/azuracast/www/src/Service/ServiceControl.php && \
    rm /etc/supervisor/full.conf.d/sftpgo.conf

# disable php-nowplaying
RUN sed -i -e '/php-nowplaying/d' /var/azuracast/www/src/Service/ServiceControl.php && \
    rm /etc/supervisor/full.conf.d/php-nowplaying.conf

COPY frontend/vite_dist.zip /tmp/

RUN unzip /tmp/vite_dist.zip && \
    rm -rf /var/azuracast/www/web/static/vite_dist && \
    mv vite_dist /var/azuracast/www/web/static/ && \
    rm /tmp/vite_dist.zip
