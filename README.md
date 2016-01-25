# k0st/moloch

Docker Moloch container

Image is based on the [debian](https://registry.hub.docker.com/u/debian/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/k0st/moloch.svg)](https://imagelayers.io/?images=k0st/moloch:latest 'latest')

## Docker image usage

```
docker run k0st/moloch [capture]
```

## Examples

Run capture on docker container eth0 interface:

```
docker run k0st/moloch capture
```

Run viewer and import pcap to analyze:

```
docker run -v /path/to/host/pcap:/data/pcap:rw k0st/moloch
docker exec containerid /data/moloch/bin/moloch-capture -r /data/pcap/sniff.pcap -t mysniff
```
