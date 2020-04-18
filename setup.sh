# /bin/sh
sudo apt-get update
sudo apt-get install -y gnupg curl git
curl https://cdn.jsdelivr.net/gh/canha/golang-tools-install-script/goinstall.sh | bash
ln -s ~/.go/bin/go /usr/local/bin
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
go get -u github.com/cosmtrek/air
go get golang.org/x/tools/gopls@latest
ln -s ~/go/bin/gopls /usr/local/bin
export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
curl https://cdn.jsdelivr.net/gh/tj/n/bin/n | bash -s lts
npm i -g --unsafe-perm=true --allow-root mirror-config-china --registry=https://registry.npm.taobao.org


# install mariadb 
echo "mariadb-server-10.1 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mariadb-server-10.1 mysql-server/root_password_again password root" | sudo debconf-set-selections
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y mariadb-server-10.1

sudo sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf

sudo service mysql restart

# install mongodb
sudo apt-get install -y  mongodb
sudo service mongodb start


cd web && npm i 