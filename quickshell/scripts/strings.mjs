export function truncateMiddle(str, maxLength) {
  if (typeof str !== "string" && !(str instanceof String)) {
    return "";
  }

  if (str.length <= maxLength) {
    return str;
  }

  if (maxLength <= 3) {
    return str.slice(0, maxLength); // not enough room for "..."
  }

  const charsToShow = maxLength - 3; // space left after "..."
  const frontChars = Math.ceil(charsToShow / 2);
  const backChars = Math.floor(charsToShow / 2);

  const start = str.slice(0, frontChars);
  const end = str.slice(str.length - backChars);

  return start + "..." + end;
}
