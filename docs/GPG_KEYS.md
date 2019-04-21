# GPG Keys

## Why to use?
GnuPG is a tool you use to protect your privacy. Your privacy is protected if you can correspond with others without eavesdroppers reading those messages.

## Install

Linux
```
apt-get install gnupg
```

macOS
```
brew install gnupg
```

## Generate Keys
Necessary if you expect to receive encrypted messages is a key pair. A public key that you can distribute on the internet as freely as you see fit and a private key which should be guarded and protected.

gpg provides a command option for this:
```
$ gpg --gen-key
```

If you are able to create a key successfully it should be in your list of keys, both the secret list and the public list:

```
$ gpg --list-keys
$ gpg --list-secrety-keys

/home/josh/.gnupg/secring.gpg
-----------------------------
sec   1024D/D0FE7AFB 2004-06-24
uid                  Josh Triplett
uid                  Josh Triplett
ssb   2048g/E75EAB2B 2004-06-24
```

## Publish on Keyserver
To send your key to a keyserver, you need to know your key ID. You can print the information on all keys you have the private key for by running **gpg --list-secret-keys**. This will generate output similar to the following:
```
/home/josh/.gnupg/secring.gpg
-----------------------------
sec   1024D/D0FE7AFB 2004-06-24
uid                  Josh Triplett
uid                  Josh Triplett
ssb   2048g/E75EAB2B 2004-06-24
```

From this, you can see my primary key ID, D0FE7AFB.
Now that you know your key ID, you can send your public key to the default keyserver with the --send-keys option:
```
$ gpg --keyserver keys.gnupg.net --send-keys D0FE7AFB
gpg: sending key D0FE7AFB to hkp server keys.gnupg.net
```

### Another option 
If this does not work, there is another option to send your key to a keyserver. 

1) Enter this site: http://keys.gnupg.net/
2) ```gpg --armor --export you@example.com```
3) Example to key block :
```
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFuhU7sBCACrT/VFfwI59blTqWWwVee/AtYkOiyu/4Hm9LsrPVrhrqRNYnH1
X+dMLHbVkKMrL/MJ6OFXGGVC9EiO5jUk2+iadt06CLOSkihK8hQl4OQ0Sr/ad3U3
jAv3r+hGnyLj4jUlXKxiXRjkQ4y5FI8HqpPM3/DVKws9UUABrbrJ8/Yrnfe5vven
AJ7y7/qBSa9oYEXadcwvSrCb3AbeBQkhCHdsj+JzT042g1bp8zY6K7JSbP3FpzFK
0OpkiclJ5LyzLwKCkMO0PxnpQqo+6fMM5PO9zf81QrskgeT9xs/r0pj/5whjxfLy
bDuh4gk3YqH5nbwvLqt3Ik4K0hUQ2VO8S+dPABEBAAG0JUFydGh1ciBEaW5peiA8
YXJ0aHVyYmRpbml6QGdtYWlsLmNvbT6JAVQEEwEIAD4WIQSKAq571vx8nBkw+THZ
Zos8v1l6SgUCW6FTuwIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAK
CRDZZos8v1l6SlNDCACYQ8sCQfOwe97pfS2aXBPIEpoFnuLgRAL2DaThliCIyj/o
ICxtzuKApkJuD9jSTEPiVYsfPhKgO+jQMrk40rNbe9aYUNCXWYhzI8HN3bJr5cdN
fvhlN5gAJ0CCX22+apWSwk4ayrZ1/BlRX1JC/TO4Yj6ajAzXuksToTcxiMa9nzPX
laDKzysCic4QZRIG3a95T8rHXhgt0mcTw3PAcxulAPvLSUz6hBlWg2q4PcbAZE3a
9ZZAUMOSstOqYXI0jv4uzghgGg+P8chziD9DZlYb/Ak1TL4P1g25FTaPSF07xfmi
3TgiBez7wxHb1AGauOyqco0Gf/HUdfY8VWWQSxm5uQENBFuhU7sBCADDRfhzeOJR
sWZQDfPmG+wfeSUKHdGIsnF2MExd3gTPr0KXNEpCfmg14x8YEXV/lazbelmzC1vN
-----END PGP PUBLIC KEY BLOCK-----
```

4) Paste the key block in site  
5) Your key will already be on a keyserver. 