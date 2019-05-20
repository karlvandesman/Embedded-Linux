# SSH Commands

### How to install (server and client)
You have to install 2 diffent packages in the client machine and in the server machine.
- For the client: `$sudo apt install openssh-client`.
- For the server (the machine to be controlled): `$sudo apt install openssh-server`.

### How to start/restart/stop the ssh service

- Starting the ssh service: `$sudo service ssh start`.

- Stopping the ssh service: `$sudo service ssh stop`.

- After some changes, we need to restart the service in order to use a new configuration: `$sudo service ssh restart`.

- Checking the status and extra infos: `$sudo service ssh status`.

### How to connect
To connect the client to the server: `sudo ssh username:ipAddress`.

So, we need to know a username in the server and its ip address. As an example, being karl and 192.168.1.2 the **username** and the **ip address**, respectively, we will have: `sudo ssh karl@192.168.1.2`

#### Connecting through a different port
By default, the port number to set up a connection through ssh is 22. If we want to change it, we have to change the configuration file of ssh. Its address is /etc/ssh/sshd_config: `$sudo nano /etc/ssh/sshd_config`.
Usually the command to set the port number is commented: `#Port 22`. So, you just have to uncomment and change it to the desired port number. Save the file, restart the ssh service, and then, to start a new connection:
`$sudo username@ipAddress -p portNumber`.

### Copying files through SSH (https://www.computerhope.com/unix/scp.htm)
SCP (Secure Copy) is the command to send files over SSH. So, you can copy files from your raspberry to another machine, or vice-versa. It is similar to the cp command, but over a network.

The syntax of cp command is: `cp addressOrigin/filename addressDestination/`.

Equivalently, we need to specify the origin address and the destination address, as arguments of the scp command: `$scp filename.txt username@ipAddress:`.

The above command will copy and send over the network (upload) the file *filename.txt* in the ~/ directory to the ~/ directory of the other machine.

If we want to copy a file from another machine (download it), we just have to inverter the order: `scp username@ipAddress:~/Documents/'file test.txt' ~/`.

The above command download the file called *file test.txt* from the ~/Documents/ directory, to the ~/ directory at your machine. 

### Using RSA keys

To generate the keys to be used in the ssh communication: `$ssh-keygen`.

This command will generate public/private rsa key pair. The public key, as it says, is public, so if you want to commuincate to a server through ssh keys, you have to share your public key. And of course, you shouldn't share your private key.

By default, it will store the rsa key pair into /home/username/.ssh/. You will be asked to enter a passphrase.

To send your public key to the machine that you want to communicate: `$ssh-copy-id username@ipAddress`.

The above command will copy the client public key to the specified username at the ip address, in order to enable the communication. It will be stored in a file called "authorized_keys" in the server, at the directory /home/username/.ssh.
