#!/usr/bin/env bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

context_info=""
if [ -n "$used_pct" ]; then
  context_info=" | ctx: $(printf '%.0f' "$used_pct")%"
fi

rate_info=""
rate_parts=""
if [ -n "$five_hour" ] && [ "$(printf '%.0f' "$five_hour")" != "0" ]; then
  rate_parts="5h:$(printf '%.0f' "$five_hour")%"
fi
if [ -n "$seven_day" ] && [ "$(printf '%.0f' "$seven_day")" != "0" ]; then
  if [ -n "$rate_parts" ]; then
    rate_parts="$rate_parts 7d:$(printf '%.0f' "$seven_day")%"
  else
    rate_parts="7d:$(printf '%.0f' "$seven_day")%"
  fi
fi
if [ -n "$rate_parts" ]; then
  rate_info=" | $rate_parts"
fi

printf "\033[38;5;239m[%s%s%s]\033[0m" \
  "$model" \
  "$context_info" \
  "$rate_info"
