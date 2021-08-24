FROM docker:19.03.5

RUN apk add --no-cache \
		ca-certificates \   
        py-pip \
        zip
RUN pip install --upgrade awscli==1.18.39
RUN aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email | source /dev/stdin
RUN apk add curl
RUN apk add git
RUN apk add bash
RUN apk add nodejs
RUN apk add npm
RUN apk add jq
RUN npm install -g yarn
RUN npm install -g webpack
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -LO https://get.helm.sh/helm-v3.1.0-linux-amd64.tar.gz
RUN tar -zxvf helm-v3.1.0-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm
RUN rm -rf linux-amd64 && rm -rf helm-v3.1.0-linux-amd64.tar.gz
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
