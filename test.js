const a = "aaa  aaaa a aㅁaa a da aaaaaad";
const prTitle = process.env.PR_TITLE;
const parsedVersion = prTitle.match(
  /(PreMinor)|(PrePatch)|(Major)|(Minor)|(Patch)/
);
if (!parsedVersion) {
  return;
}
const whichVersion = parsedVersion[0].toLocaleLowerCase();

return whichVersion;
