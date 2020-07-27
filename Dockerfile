FROM centos:8
COPY . /app/platform-docs
RUN yum install -y git nodejs unzip nginx && \
    cd /usr/bin && \
    curl -o /app/hugo.tgz -L https://github.com/gohugoio/hugo/releases/download/v0.73.0/hugo_extended_0.73.0_Linux-64bit.tar.gz && \
    tar -xvf /app/hugo.tgz hugo && \
    chmod 755 hugo && \
    chmod -R g+rwX /app && \
    cd /app/platform-docs && \
    mkdir -p themes && \
    git submodule update --init --recursive && \
    npm install -D --save autoprefixer postcss-cli && \
    hugo && \
    cp /app/platform-docs/nginx.conf /etc/nginx/nginx.conf && \
    rm -rf /app/hugo.tgz /app/docsy.zip /app/platform-docs/node_modules /app/platform-docs/themes/docsy && \
    yum remove -y git nodejs unzip && \
    yum clean all
WORKDIR /app/platform-docs/public
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]