FROM centos:7

RUN yum update -y
    # yum install -y httpd

RUN yum install -y epel-release
	
RUN yum install -y --enablerepo=epel python36  python36-devel python36-pip


# Apache自動起動
# RUN systemctl enable httpd.service

# pip 更新
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools

# Python ライブラリ インストール
# jupyter
RUN pip3 install jupyterlab \ 
# jupyter日本語化
jupyterlab-language-pack-ja-JP 

RUN pip3 install \
# グラフの可視化
matplotlib \
# グラフ/ネットワーク理論系の計算
networkx \
# 画像処理
pillow

# lsof は、サーバーで特定のポート番号を待ち受けているかどうか、指定ファイルは誰が読み込んでいるのかを調べる
RUN yum install -y vim \
    yum -y install lsof
    # yum install -y nodejs 


# ホストで用意した設定ファイルを反映
# COPY ./copy/httpd.conf /etc/httpd/conf/httpd.conf
# COPY ./copy/v_host.conf /etc/httpd/conf.d/v_host.conf
# COPY ./copy/php.ini /etc/php.ini
# COPY ./copy/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf

# MySQLの設定
# COPY ./copy/my.cnf /etc/my.cnf


#公開ポート番号
EXPOSE 80