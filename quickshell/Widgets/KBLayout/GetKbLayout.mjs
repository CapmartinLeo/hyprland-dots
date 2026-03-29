export function getKbLayout(devicesJson) {
	const hyprDevices = JSON.parse(devicesJson);
	const keyboards = hyprDevices["keyboards"];

	if (!keyboards || keyboards.length === 0) {
		return "Unknown";
	}

	let mainKb = keyboards.find((keyboard) => keyboard.main);
	if (!mainKb) {
		mainKb = keyboards[keyboards.length - 1];
	}

	return mainKb["active_keymap"];
}
