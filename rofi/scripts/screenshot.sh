#!/bin/sh

save_dir="$HOME/Pictures/Screenshots"
mkdir -p "$save_dir"

theme_selector="~/.config/rofi/themes/screenshot-selector.rasi"

monitor="󰍹 Monitor"
window=" Window"
region="󰩭 Region"

copy=" Copy"
save=" Save"
edit="󰈙 Edit"

modes="$region\n$window\n$monitor"
actions="$copy\n$save\n$edit"

# Generate a temp file for the screenshot
tempfile=$(mktemp /tmp/hyprshot-XXXXXX.png | cut -d '/' -f 3)

post_screenshot_action() {
    action=$(echo -e "$actions" | rofi -dmenu -theme "$theme_selector")

    case "$action" in
        "$copy")
            if command -v wl-copy >/dev/null 2>&1; then
                wl-copy < "/tmp/$tempfile"
                notify-send -i "/tmp/$tempfile" "Screenshot copied..." "...to clipboard."
            else
                notify-send "wl-copy not found!" "Install wl-clipboard to copy to clipboard. Screenshot is at /tmp/$tempfile"
            fi
            # Clean up the temp file
            rm -f "/tmp/$tempfile"
            ;;
        "$save")
            filename="$save_dir/screenshot-$(date +%Y%m%d_%H%M%S).png"
            mv "/tmp/$tempfile" "$filename"
            notify-send -i "$filename" "Screenshot saved to" "$filename"
            ;;
        "$edit")
            filename="$save_dir/screenshot-$(date +%Y%m%d_%H%M%S).png"
            mv "/tmp/$tempfile" "$filename"
            notify-send -i "$filename" "Screenshot saved to" "$filename"
            pinta "$filename" &
            ;;
        *)
            notify-send -i "/tmp/$tempfile" "No action taken" "Screenshot is at /tmp/$tempfile"
            ;;
    esac
}

take_screenshot() {
    mode=$1

    # Determine hyprshot mode
    case "$mode" in
        monitor)
            hypr_mode="output"
            ;;
        window)
            hypr_mode="window"
            ;;
        region)
            hypr_mode="region"
            ;;
        *)
            echo "Invalid mode"
            exit 1
            ;;
    esac

    # Take the screenshot and save to temp file
    hyprshot -m "$hypr_mode" -o /tmp -f "$tempfile" -s 2> /tmp/err_hyprshot
    error=$(cat /tmp/err_hyprshot)
    rm /tmp/err_hyprshot

    if [ -z "$error" ]; then
        # After the shot, show save/copy options
        post_screenshot_action
    fi
}

# Main: select the mode
mode=$(echo -e "$modes" | rofi -dmenu -p "Select screenshot mode" -theme "$theme_selector")
case "$mode" in
    $monitor)
        take_screenshot monitor
        ;;
    $window)
        take_screenshot window
        ;;
    $region)
        take_screenshot region
        ;;
    *)
        echo "No valid mode selected"
        ;;
esac
