#!/bin/bash

if [[ -z $1  ]]; then
{
  echo Usage: $0 Version
  exit 0
};
fi

git clone git://gitorious.org/~drol/osm3s/drol-osm3s

pushd drol-osm3s/
yes | rm -R .git

bash ./boostrap.sh
popd

mv drol-osm3s "osm-3s_v$1"
tar cvf - "osm-3s_v$1/" | gzip >"../misc-www/osm-3s_v$1.tar.gz"
rm -R "osm-3s_v$1"
