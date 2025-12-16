# End-to-End Java Application Deployment with Tomcat & Nginx

## Objective
Provision a Linux application server, build a Java web application using Maven, deploy it on Apache Tomcat, and expose it via Nginx as a reverse proxy.

This setup follows real-world DevOps practices: dedicated users, systemd services, firewall rules, and clean separation of concerns.

---

## System Preparation

### Install required packages
```bash
dnf install -y wget git vim unzip
````

### Enable and start firewall

```bash
systemctl start firewalld
systemctl enable firewalld
```

---

## Java Installation

### Install Java 17 (OpenJDK)

```bash
dnf -y install java-17-openjdk java-17-openjdk-devel
```

### Verify Java

```bash
java -version
```

---

## Tomcat Installation

### Download Tomcat

```bash
wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.26/bin/apache-tomcat-10.1.26.tar.gz
```

### Extract archive

```bash
tar -xzvf apache-tomcat-10.1.26.tar.gz
```

### Create Tomcat user

```bash
useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat
```

### Copy Tomcat files

```bash
mkdir -p /usr/local/tomcat
cp -r /tmp/apache-tomcat-10.1.26/* /usr/local/tomcat/
```

### Set ownership

```bash
chown -R tomcat:tomcat /usr/local/tomcat
```

---

## Tomcat systemd Service

### Create service file

```bash
vi /etc/systemd/system/tomcat.service
```

### Service configuration

```ini
[Unit]
Description=Tomcat
After=network.target

[Service]
Type=simple
User=tomcat
Group=tomcat
WorkingDirectory=/usr/local/tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-17-openjdk"
Environment="CATALINA_HOME=/usr/local/tomcat"
Environment="CATALINA_BASE=/usr/local/tomcat"
Environment="CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid"

ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh

Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

### Enable and start Tomcat

```bash
systemctl daemon-reload
systemctl enable --now tomcat
systemctl status tomcat
```

---

## Firewall Configuration

### Open Tomcat port

```bash
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --reload
```

---

## Maven Installation

### Download Maven

```bash
wget https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip
```

### Extract and install

```bash
unzip apache-maven-3.9.9-bin.zip
cp -r apache-maven-3.9.9 /usr/local/maven3.9
```

### Set JVM options

```bash
export MAVEN_OPTS="-Xmx512m"
```

---

## Application Build

### Clone repository

```bash
git clone -b local https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
```

### Update backend configuration

```bash

vim src/main/resources/application.properties
```

### Build application

```bash
/usr/local/maven3.9/bin/mvn install
```

---

## Application Deployment

### Remove default ROOT app

```bash
rm -rf /usr/local/tomcat/webapps/ROOT*
```

### Deploy WAR file

```bash
cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
chown -R tomcat:tomcat /usr/local/tomcat/webapps
systemctl restart tomcat
```

---

## Nginx Reverse Proxy

### Create site configuration

```bash
vi /etc/nginx/sites-available/vproapp
```

### Nginx config

```nginx
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;

    location / {
        proxy_pass http://vproapp;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Enable site

```bash
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp
```

### Validate and reload Nginx

```bash
nginx -t
systemctl reload nginx
```

---

## Outcome

* Java application successfully built and deployed
* Tomcat managed via systemd
* Nginx reverse proxy serving application on port 80
* Firewall configured correctly
* Clean, production-style setup achieved

---

## What This Demonstrates

* Hands-on Linux system administration
* Java application build & deployment
* Tomcat service management
* Nginx reverse proxy configuration
* Real-world DevOps troubleshooting and sequencing

---

## Possible Enhancements

* HTTPS with Let’s Encrypt
* Environment-based configs
* CI/CD pipeline integration
* Containerization with Docker

``````

