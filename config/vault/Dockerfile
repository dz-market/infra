ARG VAULT_VERSION
ARG OPENTOFU_VERSION

FROM ghcr.io/opentofu/opentofu:${OPENTOFU_VERSION}-minimal AS tofu

FROM hashicorp/vault:${VAULT_VERSION}

USER root

RUN apk add --no-cache ansible-core

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

COPY ansible/ /ansible/
COPY provisioning/ /provisioning/

WORKDIR /ansible

ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

ENTRYPOINT ["ansible-playbook", "-i", "localhost,"]