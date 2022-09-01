const a = "aaaaaaa aㅁaaa da aaaaad";
const prTitle = process.env.PR_TITLE;
const parsedVersion = prTitle.match(
  /(PreMinor)|(PrePatch)|(Major)|(Minor)|(Patch)/
);
if (!parsedVersion) {
  return;
}
const whichVersion = parsedVersion[0].toLocaleLowerCase();

return whichVersion;
