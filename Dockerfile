FROM opensecurity/mobile-security-framework-mobsf:latest

LABEL version="latest"
LABEL repository="https://github.com/qlkwej/mobsf-action"
LABEL homepage="https://github.com/qlkwej/mobsf-action"
LABEL maintainer="Ian Koerich Maciel <inm@certi.org.br>"

LABEL com.github.actions.name="GitHub Action for MobSF"
LABEL com.github.actions.description="Wraps the MobSF docker to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

USER root
RUN apt-get update -y && \
  apt-get install -y curl jq

# RUN chown -R 9901:9901 /home/mobsf
# USER mobsf
COPY LICENSE README.md /
COPY "entrypoint.sh" "/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"

ENTRYPOINT ["/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"]
CMD ["--help"]
