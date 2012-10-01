mv drol-osm3s "osm-3s_v$1"
tar cvf - osm-3s/ | gzip >"../misc-www/osm-3s_v$1.tar.gz"
yes | rm -R "osm-3s_v$1"

pushd build
../src/configure --prefix=YOUR_PATH
make install
popd

pushd bin
./update_database --db-dir=YOUR_DB_DIR
# may take up to 24 hours ...
popd

bin/osm3s_query --no-mime --db-dir=YOUR_DB_DIR
