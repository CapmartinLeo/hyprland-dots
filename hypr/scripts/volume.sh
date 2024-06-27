#!/bin/sh

NOTIFY_ID_FILE="/tmp/volume_notify_id"

get_volume() {
	volume=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2) * 100/1" | bc)
	echo "$volume"
}

get_mute() {
	mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f3)

	if [ "$mute" = "[MUTED]" ]; then
		return 0
	else
		return 1
	fi
}

get_id() {
	if [ -f "$NOTIFY_ID_FILE" ]; then
		notify_id=$(cat "$NOTIFY_ID_FILE")
	else
		notify_id=0
	fi
	echo "$notify_id"
}

notify_volume() {
	volume=$(get_volume)
	notify_id=$(get_id)

    notify_id=$(notify-send -r "$notify_id" -h int:value:$volume "Volume: $volume%" -t 2000 -p)
    echo "$notify_id" > "$NOTIFY_ID_FILE"
}

notify_mute() {
	notify_id=$(get_id)

	notify_id=$(notify-send -r "$notify_id" -h int:value:0 "Volume: Muted" -t 2000 -p)
	echo "$notify_id" > "$NOTIFY_ID_FILE"
}

toggle_mute() {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	get_mute

	if [ "$?" = 0 ]; then
		notify_mute
	else
		notify_volume
	fi
}

increase() {
	get_mute
	if [ "$?" = 0 ]; then
		wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
	fi

	wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
	notify_volume
}

decrease() {
	get_mute
	if [ "$?" = 0 ]; then
		wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
	fi

	wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-
	notify_volume
}

if [ "$1" = "--toggle" ]; then
	toggle_mute
elif [ "$1" = "--inc" ]; then
	increase
elif [ "$1" = "--dec" ]; then
	decrease
else
	echo "Usage: volume.sh [--toggle | --inc | --dec]"
fi
