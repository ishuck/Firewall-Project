# Basic firewall configuration template
set firewall name HR-TO-ACC {
    default-action drop
    enable-logging
    rule 1 {
        action accept
        protocol tcp
        destination {
            port 3389
            address 192.168.2.0/24
        }
        source {
            address 192.168.1.0/24
        }
    }
}
