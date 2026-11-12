ARG PROTOBUF_IMAGE=ghcr.io/dz-market/protobuf:latest
ARG ENVOY_IMAGE=envoyproxy/envoy:v1.39.3

FROM ${PROTOBUF_IMAGE} AS descriptor

FROM ${ENVOY_IMAGE}

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends gettext-base

COPY --chmod=755 config/envoy/scripts/entrypoint.sh /usr/local/bin/edge-entrypoint

COPY --from=descriptor /marketplace.binpb /etc/envoy/marketplace.binpb

COPY config/envoy/envoy.yml \
    config/envoy/listeners.yml \
    config/envoy/routes.yml \
    config/envoy/clusters.yml \
    /etc/envoy/

ENTRYPOINT ["/usr/local/bin/edge-entrypoint"]

CMD ["envoy", "-c", "/etc/envoy/envoy.yml"]