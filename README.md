# dockerApache

$dockerps = docker ps -a -q -f name=web1
if ($dockerps) {
  docker rm -f $dockerps
}
docker build $env:WORKSPACE -t test_build
docker run -it -p 38000:80 --name web1 -d test_build 
