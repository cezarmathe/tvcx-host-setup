#!/usr/bin/env bash

# This script will set up each host that will be part of the stack, doing the following things:
# - install consul-template
# - install a systemd service template for consul-template
# - activate a systemd service for each directory in /etc/consul-template.d/

# Get the system architecture.
ARCH=""
case "$(uname -m)" in
"x86_64")
    ARCH="amd64"
    ;;
"aarch64")
    ARCH="arm64"
    ;;
*)
    printf "%s\n" "Unsupported architecture: $(uname -m)"
    ;;
esac

# If no version has been specified through an environment variable, set the default as the latest.
if [[ -z "${CONSUL_TEMPLATE_VERSION}" ]]; then
    CONSUL_TEMPLATE_VERSION="0.25.1" # latest version
fi

# Print an error message and exit.
function printf_and_exit() {
    local msg
    msg="$1"; shift
    local exitcode
    exitcode="$1"; shift

    printf "%s\n" "${msg}"
    exit ${exitcode}
}

function main() {
    printf "%s\n" "Downloading consul-template ${CONSUL_TEMPLATE_VERSION} for ${ARCH}"
    wget -O consul-template.tgz \
        "https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_${ARCH}.tgz" \
        || printf_and_exit "Failed to download consul-template ${CONSUL_TEMPLATE_VERSION} for ${ARCH}" 1

    printf "%s\n" "Extracting the archive"
    tar xf consul-template.tgz -C /usr/local/bin/ \
        || printf_and_exit "Failed to extract the archive" 1

    printf "%s\n" "Deleting the archive" \
        || printf_and_exit "Failed to delete the archive" 1
    rm consul-template.tgz

    printf "%s\n" "Installing the systemd service template for consul-template" \
        || printf_and_exit "Failed to install the systemd service for consul-template" 1
    cat > /etc/systemd/system/consul-template@.service <<EOF
[Unit]
Description=consul-template
Documentation=https://github.com/hashicorp/consul-template
Wants=network-online.target
After=network-online.target
[Service]
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/consul-template -config /etc/consul-template.d/%i/config.hcl
KillMode=process
KillSignal=SIGINT
Restart=on-failure
RestartSec=2
[Install]
WantedBy=multi-user.target
EOF

    printf "%s\n" "Activating consul-template services"
    for dir in $(find /etc/consul-template.d -type d); do
        local name
        name="$(basename ${dir})"
        printf "%s\n" "Activating ${name}"
        systemctl enable --now "consul-template@${name}" \
            || printf_and_exit "Failed to enable and start consul-template@${name}" 1
    done
}

main $@
