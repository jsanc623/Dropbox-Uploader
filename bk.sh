dt=$(date +%s)

echo "Starting backup"
echo $(date) / $dt

# Copy these from your .dropbox_uploader config file
export APPKEY=
export APPSECRET=
export ACCESS_LEVEL=
export OAUTH_ACCESS_TOKEN=
export OAUTH_ACCESS_TOKEN_SECRET=

mysqldump -udatabase_user -p --databases database_name > dbbk_$dt.sql

./dropbox_uploader.sh upload dbbk_$dt.sql dbbk_$dt.sql

rm dbbk_$dt.sql
