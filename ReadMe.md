# Devops on Linux Training on OPSWAT Internship

> Frist u need a linux enviroment.

## ✅ Requirements

### 1. Environment Configuration
- Store the city name in `/etc/default/weather` using a variable:
  ```
  CITY=Timisoara
  ```
- The script reads the `CITY` environment variable and defaults to `Timisoara` if not set.

### 2. Weather Script
- **Location:** `/usr/local/sbin/weather.sh`
- **Responsibilities:**
  - Installs required packages (`curl`, `jq`) if missing.
  - Fetches weather info from `wttr.in/$CITY`.
  - Generates a clean `/etc/motd` containing:
    - Project header (`Welcome to your Dev VM`)
    - City name
    - Weather info
    - Hostname and current time
  - Script is idempotent (always overwrites MOTD, never appends).

### 3. systemd Service
- **Location:** `/etc/systemd/system/weather.service`
- **Responsibilities:**
  - Runs `weather.sh` at boot.
  - Loads environment variables from `/etc/default/weather`.
  - Sets `Type=oneshot` and `RemainAfterExit=yes`.

---

## 🔍 Verification

### Expected MOTD Output
After running, at login or using `cat /etc/motd` you should see:
```
==== Welcome to your Dev VM ====
City: <city>
Weather today: <curl output>
Hostname: <hostname>
Time: <timestamp>
===============================
```

### Service Status
- `systemctl status weather.service` must show `active (exited)`.
- Changing `CITY` in `/etc/default/weather` and restarting the service must update MOTD.

---
