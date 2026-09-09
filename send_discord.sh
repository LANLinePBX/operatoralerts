#!/bin/bash

# Assign parameters passed from Asterisk dialplan
CALLER_NAME="$1"
CALLER_NUM="$2"
OPERATOR_ROLE="<@&YOUR_DISCORD_ROLE_ID>"
CALL_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# Fallback values if fields are blank
if [ -z "$CALLER_NAME" ]; then CALLER_NAME="Unknown"; fi
if [ -z "$CALLER_NUM" ]; then CALLER_NUM="Unknown"; fi

# Execute the curl directly from Linux shell
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "content": "'"${OPERATOR_ROLE}"'",
    "embeds": [{
      "title": "🚨 INCOMING OPERATOR CALL",
      "color": 15158332,
      "fields": [
        {"name": "👤 Caller Name", "value": "'"${CALLER_NAME}"'", "inline": false},
        {"name": "📞 Extension", "value": "'"${CALLER_NUM}"'", "inline": false},
        {"name": "⏰ Time", "value": "'"${CALL_TIME}"'", "inline": false}
      ],
      "footer": {"text": "Operator Alerts"}
    }]
  }' "https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN"
