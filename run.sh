#sudo docker run -p 8080:80 -p 2222:22 -p 17076:7076 -i -t sendgridjp/sendgridjp-webhook-docker /usr/bin/supervisord
#sudo docker run -p 8080:80 -p 2222:22 -p 17076:7076 -t sendgridjp/sendgridjp-webhook-docker /usr/sbin/sshd -D &
sudo docker run -p 8080:80 -p 2222:22 -p 17076:7076 -i -t sendgridjp/sendgridjp-webhook-docker 

