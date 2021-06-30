# !/bin/sh
# Update your input volume to 0% or 100% by executing this script.
mic_level=$(osascript -e "input volume of (get volume settings)")
if (( mic_level <= 0 )); then
  osascript -e "set volume input volume 100"
  echo "You're no longer muted"
else
  osascript -e "set volume input volume 0"
  echo "You're muted"
fi
