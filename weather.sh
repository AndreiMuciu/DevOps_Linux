  GNU nano 8.3                                                             usr/local/sbin/weather.sh
#!/bin/bash
source /etc/default/weather

if [ -z "$CITY" ]; then
  CITY="Timisoara"
fi

# Fetch weather, salvează în variabilă
WEATHER=$(curl -s wttr.in/$CITY)

# Logare fetch în /var/log/weather.log cu timestamp
echo "$(date '+%Y-%m-%d %H:%M:%S') | $CITY | $WEATHER" >> /var/log/weather.log

# Construim MOTD
echo "Welcome to Mucioniu Constantin Andrei Dev VM" > /etc/motd
echo "Weather for: $CITY" >> /etc/motd
echo "$WEATHER" >> /etc/motd
echo "" >> /etc/motd
echo "Hostname: $(hostname)" >> /etc/motd
echo "Current time: $(date)" >> /etc/motd
echo "Uptime: $(uptime -p)" >> /etc/motd
echo "Disk usage:" >> /etc/motd
df -h / >> /etc/motd
