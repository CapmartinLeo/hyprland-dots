import { truncateMiddle } from "../../scripts/strings.mjs"


const icons = {
  'Firefox': '󰈹',
  'Microsoft Edge': '󰇩',
  'Discord': '',
  'Plex': '󰚺',
  'Spotify': '󰓇',
  'Vlc': '󰕼',
  'Mpv': '',
  'Rhythmbox': '󰓃',
  'Google Chrome': '',
  'Brave Browser': '󰖟',
  'Chromium': '',
  'Opera': '',
  'Vivaldi': '󰖟',
  'Waterfox': '󰈹',
  'Thorium': '󰈹',
  'Mozilla zen': '',
  'Floorp': '󰈹',
}
const defaultIcon = '󰝚'

export function formatMediaTitle(player, maxTitleLength) {
  const title = truncateMiddle(player?.trackTitle, maxTitleLength);
  const artist = player?.trackArtist;

  let result = ""
  if (artist !== "") result += artist + " - "
  if (title !== "") {
    result += title
  } else {
    result += "Media"
  }

  return result
}

export function getAppIcon(appname) {
  if (!(appname in icons))
    return defaultIcon

  return icons[appname]
}

export function formatTime(time) {
  let minutes = String(Math.floor(time / 60)).padStart(2, '0')
  let seconds = String(Math.floor(time % 60)).padStart(2, '0')

  return `${minutes}:${seconds}`
}
