# Monitoring configuration
monitor {
    interface eth0 {
        sampling-rate 1/100
        threshold {
            bandwidth 100Mbps
            cpu 80%
            memory 90%
        }
        alerts {
            email "admin@company.com"
            syslog priority high
        }
    }
}
