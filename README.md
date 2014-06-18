sendgridjp-webhook-docker
=========================

#Usage

##Create project on Google Developers Console
Access Google Developers Console
```bash
https://console.developers.google.com
```
- Create project
- Enable YouTube Data API v3
- Create Server Application Key. Get the key.

##Clone from repository
Clone from repository.  
```bash
$ clone https://github.com/SendGridJP/sendgridjp-webhook-docker.git
```

##Edit .env
Copy .env.example to .env. Also edit .env.
```bash
$ cd sendgridjp-webhook-docker
$ cp .env.example .env
$ vi .env
```

Paste Server Application Key to youtube_api_key.
```bash
YOUTUBE_API_KEY=youtube_api_key
```

##Build
Run the build command.  
```bash
$ sudo docker build -t sendgridjp/sendgridjp-webhook-docker .
```

##Run
Run the docker run command.
```bash
$ sudo docker run -p 8080:80 -p 2222:22 -p 17076:7076 -i -t sendgridjp/sendgridjp-webhook-docker
```

##Access to the application
###Eventkit
http://%IpAddress%:8080/index.php
- Setup basic authentication and Event Notification of your SendGrid account.


###sendgridjp-parse-demo
http://%IpAddress%:17076/
- Setup Incoming parse webhook settings.
- Setup DNS of your domain.
