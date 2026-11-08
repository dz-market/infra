ARG PROTOBUF_IMAGE=ghcr.io/dz-market/protobuf:latest
ARG ENVOY_IMAGE=envoyproxy/envoy:v1.39.3

FROM ${PROTOBUF_IMAGE} AS descriptor

FROM ${ENVOY_IMAGE}

COPY --from=descriptor /marketplace.binpb /etc/envoy/marketplace.binpb