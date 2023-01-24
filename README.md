# AndroBurpInstall
Burp certificate installer for Android emulator.

### Usage

Before starting the script, export your burp certificate from Burp Suite and convert it with these lines:

```bash
$ openssl x509 -inform DER -in cacert.der -out cacert.pem
puis,
$ CERT="`openssl x509 -inform PEM -subject_hash_old -in cacert.pem | head -1`.0"
puis,
$ mv cacert.pem $CERT
```

Then, change the CERT variable in AndroBurpInstall.sh for the path to your certificate and launch the script.

### Video

[Capture vidéo du 24-01-2023 11:02:19.webm](https://user-images.githubusercontent.com/40497633/214298609-68a6c25e-53d8-425e-83ff-674a9668be63.webm)
