# Steps to reproduce problem

### On Mac
vagrant up
./run-cmd.sh

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
