# Steps to reproduce problem

### On Mac
```
vagrant up
./run-cmd.sh # Open up a docker container based off of standard "ubuntu" image
```

### In docker image
```
./bootstrap.sh
./test-cmd.sh # This fails on the second request, not the first
```

Output:
```
root@68465dcf84e5:/vagrant# ./test-cmd.sh 
5+0 records in
5+0 records out
5120 bytes (5.1 kB) copied, 2.5702e-05 s, 199 MB/s
20000+0 records in
20000+0 records out
20480000 bytes (20 MB) copied, 0.0391031 s, 524 MB/s
ok
curl: (56) Recv failure: Connection reset by peer
```

### In VM itself (via vagrant ssh)
```
cd /vagrant
./bootstrap.sh
./test-cmd.sh
```

Output:
```
vagrant@precise64:/vagrant$ ./test-cmd.sh 
5+0 records in
5+0 records out
5120 bytes (5.1 kB) copied, 2.5421e-05 s, 201 MB/s
20000+0 records in
20000+0 records out
20480000 bytes (20 MB) copied, 0.0254474 s, 805 MB/s
ok
ok
```

### With locally running server

In Vagrant VM:

```
cd /vagrant
python simple-server.py
```

In Docker Container:
```
#Change URL to <vm ip, 10.42.42.42 if using Vagrantfile>:8000
./test-cmd.sh #works
```
On Mac itself:

```
python simple-server.py
```

In Docker VM:
```
#Change URL to <mac ip>:8000
./test-cmd.sh #works
```

In EC2 the above procedure does not work

Output:

```
oot@68465dcf84e5:/vagrant# ./test-cmd.sh 
5+0 records in
5+0 records out
5120 bytes (5.1 kB) copied, 7.5435e-05 s, 67.9 MB/s
20000+0 records in
20000+0 records out
20480000 bytes (20 MB) copied, 0.0400497 s, 511 MB/s
<html><body><h1>POST of length 5120</h1></body></html>curl: (56) Recv failure: Connection reset by peer
```

