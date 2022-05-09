FROM google/cloud-sdk:alpine

ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1

RUN apk add --no-cache --update openjdk8-jre && \
    gcloud components install beta pubsub-emulator && \
    gcloud components update

EXPOSE 8085

ENTRYPOINT [ \
  "gcloud", \
  "beta", \
  "emulators", \
  "pubsub", \
  "start", \
  "--host-port=0.0.0.0:8085" \
  "--${PROJECt_ID}"
]
