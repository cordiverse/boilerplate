FROM --platform=$BUILDPLATFORM alpine
ARG LINK
ARG TARGETPLATFORM
COPY ./setup.sh /setup.sh
RUN /setup.sh

FROM node:lts-alpine
COPY --from=0 /boilerplate.zip /boilerplate.zip
COPY ./entrypoint.sh /
VOLUME ["/cordis"]
WORKDIR "/cordis"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["yarn", "start"]
