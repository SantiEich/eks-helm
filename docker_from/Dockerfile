FROM docker:19.03.5

ENV VERIFY_CHECKSUM=false
RUN apk add --no-cache \
		ca-certificates \   
        py-pip \
        zip \
        openssl
RUN pip install --upgrade awscli==1.18.39
RUN apk add curl
RUN apk add git
RUN apk add bash
RUN apk add jq
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git

