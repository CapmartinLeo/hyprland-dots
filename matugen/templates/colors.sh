#!/bin/sh

COLORS_DARK=(
	%% color0.hex %%
	%% color1.hex %%
	%% color2.hex %%
	%% color3.hex %%
	%% color4.hex %%
	%% color5.hex %%
	%% color6.hex %%
	%% color7.hex %%
)

COLORS_LIGHT=(
	%% color8.hex %%
	%% color9.hex %%
	%% color10.hex %%
	%% color11.hex %%
	%% color12.hex %%
	%% color13.hex %%
	%% color14.hex %%
	%% color15.hex %%
)

COLORS_MISC=(
	%% background.hex %%
	%% foreground.hex %%
	%% cursor.hex %%
	%% border.hex %%
)

print_color() {
	local r g b
	r=$((16#${1:0:2}))
	g=$((16#${1:2:2}))
	b=$((16#${1:4:2}))

	echo -ne "\033[48;2;${r};${g};${b}m  \033[0m"
}

for i in "${COLORS_DARK[@]}"; do
	print_color "$i"
done

echo

for i in "${COLORS_LIGHT[@]}"; do
	print_color "$i"
done

echo

for i in "${COLORS_MISC[@]}"; do
	print_color "$i"
done

echo
