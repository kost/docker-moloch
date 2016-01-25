#!/bin/sh

MOLOCHDIR=/data/moloch

echo "Starting elasticsearch..."
cd $MOLOCHDIR/bin
./run_es.sh

echo "Giving ES time to start..."
sleep 5
until curl -sS 'http://127.0.0.1:9200/_cluster/health?wait_for_status=yellow&timeout=5s'
do
    echo "Waiting for ES to start"
    sleep 1
done
echo

if [ -z $1 ]; then
	echo "Not starting capture, start capturing with giving 'capture' parameter"
else
	echo "Starting capture on default interface. Change /data/moloch/etc/config.ini"
	nohup ./run_capture.sh
fi

echo
echo "How to import pcap?"
echo " - docker start -v /path/to/host/dir/with/pcap:/data/pcap:rw k0st/moloch"
echo " - docker exec container_id /data/moloch/bin/moloch-capture -r /data/pcap/sniff.pcap -t mysniff --copy"
echo
echo "PLEASE ignore error about mising log file. It's standard moloch start script"
echo "Starting viewer. Go with https to port 8005 of container."
./run_viewer.sh
