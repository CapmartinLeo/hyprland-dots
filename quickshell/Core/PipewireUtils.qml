pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {

	PwObjectTracker {
		objects: [ 
			Pipewire.defaultAudioSink,
			Pipewire.defaultAudioSource
		]
	}

	// -------------------------
	// State
	// -------------------------

	property PwNode defaultAudioSink: Pipewire.defaultAudioSink
	property PwNode defaultAudioSource: Pipewire.defaultAudioSource

	function isReady() {
		return Pipewire.ready
	}

	// -------------------------
	// Internal helpers
	// -------------------------

	function _getDefault(type) {
		return type === "sink"
		? defaultAudioSink
		: defaultAudioSource
	}

	function _setDefaultNode(type, node) {
		if (type === "sink")
			Pipewire.preferredDefaultAudioSink = node
		else
			Pipewire.preferredDefaultAudioSource = node
	}

	function _getNodeById(id) {
		return Pipewire.nodes.values.find(n => n.id === id)
	}

	function _getVolume(node) {
		return node?.audio?.volume ?? 0
	}

	function _setVolume(node, volume) {
		if (node?.audio)
			node.audio.volume = volume
	}

	function _isMuted(node) {
		return node?.audio?.muted ?? false
	}

	function _toggleMute(node) {
		if (node?.audio)
			node.audio.muted = !node.audio.muted
	}

	function _setDefault(type, id) {
		const current = _getDefault(type)
		const desired = _getNodeById(id)

		if (!desired || desired.id === current?.id)
			return

		_setDefaultNode(type, desired)
	}

	function _isDefault(type, id) {
		const current = _getDefault(type)
		return current?.id === id
	}

	function _getDevices(type) {
		return Pipewire.nodes.values
		.filter(node => {
			return node.audio !== null 
			&& !node.isStream 
			&& (type === "sink" ? node.isSink : !node.isSink)
		})
		.map(node => ({
			label: node.description || node.nickname || node.name,
			id: node.id
		}))
	}

	function _getIcon(type, volume, muted) {
		if (type === "sink") {
			if (muted || volume < 0.001) return "󰝟"
			if (volume <= 0.33) return "󰕿"
			if (volume <= 0.66) return "󰖀"
			return "󰕾"
		}

		// source (mic)
		if (muted || volume < 0.001) return "󰍭"
		if (volume <= 0.33) return "󰍮"
		return "󰍬"
	}

	// -------------------------
	// Public Generic API
	// -------------------------

	function getDefault(type) {
		return _getDefault(type)
	}

	function setDefault(type, id) {
		_setDefault(type, id)
	}

	function getDefaultVolume(type) {
		return _getVolume(_getDefault(type))
	}

	function setDefaultVolume(type, volume) {
		_setVolume(_getDefault(type), volume)
	}

	function isDefaultMuted(type) {
		return _isMuted(_getDefault(type))
	}

	function toggleDefaultMute(type) {
		_toggleMute(_getDefault(type))
	}

	function isDefault(type, id) {
		return _isDefault(type, id)
	}

	function getDevices(type) {
		return _getDevices(type)
	}

	function getIcon(type) {
		const node = _getDefault(type)
		return _getIcon(
			type,
			_getVolume(node),
			_isMuted(node)
		)
	}
}
