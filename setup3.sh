pushd bin
mkdir YOUR_DB_DIR/1/
./update_database --db-dir=YOUR_DB_DIR/1/
# may take up to 24 hours ...
mkdir YOUR_DB_DIR/2/
cp YOUR_DB_DIR/1/* 2/
popd

# FIRST_MINDIFF_ID from Wed, 2011-02-16: 679988
pushd bin
nohup ./fetch_osc.sh FIRST_MINDIFF_ID http://planet.openstreetmap.org/minute-replicate YOUR_REPLICATE_DIR/ &
nohup ./apply_osc_to_db.sh YOUR_DB_DIR/1/ YOUR_REPLICATE_DIR/ FIRST_MINDIFF_ID &
nohup ./apply_osc_to_db.sh YOUR_DB_DIR/2/ YOUR_REPLICATE_DIR/ FIRST_MINDIFF_ID &
nohup ./scheduler --db-dir=YOUR_DB_DIR/ &
popd
