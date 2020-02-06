# # ベースとなるDockerイメージ指定
# FROM golang:latest
# # コンテナ内に作業ディレクトリを作成
# RUN mkdir /go/src/work
# # コンテナログイン時のディレクトリ指定
# WORKDIR /go/src/work
# # ホストのファイルをコンテナの作業ディレクトリに移行
# ADD . /go/src/work

# FROM golang:latest

# ENV GOPATH /go
# ENV PATH $PATH:$GOPATH/bin

# RUN mkdir -p /go/src/api
# COPY . /go/src/api
# WORKDIR /go/src/api

# RUN go get github.com/beego/bee
# RUN go get github.com/astaxie/beego
# RUN go get gopkg.in/mgo.v2

# CMD bee run -downdoc=true -gendoc=true
FROM golang:latest

WORKDIR /go/src/godocker

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["godocker"]
