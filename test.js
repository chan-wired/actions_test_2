const prTitle = "a";
const regex =
  /\[PreMinor\])|(\[PrePatch\])|(\[Major\])|(\[Minor\])|(\[Patch\])/;
const parsedVersion = prTitle.match(regex);
if (!parsedVersion) {
  return;
}
const whichVersion = parsedVersion[0];

return whichVersion;
