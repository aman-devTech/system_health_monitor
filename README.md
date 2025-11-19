🖥️ System Health Monitor (Shell Script)

A lightweight and practical Linux system monitoring tool written entirely in Bash.
This script tracks real-time CPU, Memory, and Disk usage, and logs the results into timestamped log files.

It’s perfect for beginners practicing Linux, Shell Scripting, and DevOps fundamentals while still being a real, production-style mini project.

🚀 Features

Monitors CPU usage

Monitors Memory (RAM) usage

Monitors Disk usage

Saves logs into logs/ with timestamps

Automatically creates the logs folder

Clean and simple Bash script

Easy to run manually or automate with cron

📂 Project Structure

system-health-monitor/
├── system_health_monitor.sh
├── logs/
└── README.md

(Note: logs/ is ignored by Git because of .gitignore)

🛠️ How It Works

Each time you run the script:

CPU, memory, and disk usage are calculated

A timestamped log file is generated

Alerts print to terminal if thresholds are crossed

Script exits (not always running in background)

Example log file name:

logs/system_health_2025-11-19_17-15-07.log

▶️ Run the Script

Make script executable:
chmod +x system_health_monitor.sh

Run it:
./system_health_monitor.sh

View generated logs:
ls -lt logs/

Show the latest log file:
cat logs/$(ls -1t logs | head -n1)

🔁 Automate with Cron (Optional)

To run the script automatically every 1 minute:

crontab -e

Add this line:

/full/path/to/system_health_monitor.sh >> /full/path/to/cron.log 2>&1

🧪 Sample Log Output
----- System Health Check: Wed Nov 19 17:15:07 UTC 2025 -----
CPU Usage: 0.04%
Memory Usage: 4.61%
Disk Usage: 0%
📌 Tech Used

Linux (WSL / Docker / Any Distro)

Bash Shell

/proc/stat

/proc/meminfo

df command

Cron (optional)

🌱 Future Improvements

Discord, Slack, or Email Alerts

Colored output

Log rotation (delete logs older than X days)

JSON output mode

Flags for advanced usage (e.g., --verbose, --no-log)

👤 Author

aman-devTech
Linux • Shell Scripting • DevOps Basics • Python Learner
