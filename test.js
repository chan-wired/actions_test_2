const a = "aaa  aa a a a  aㅁa a a da  aa aaa  a d";
const prTitle = process.env.PR_TITLE;
const parsedVersion = prTitle.match(
  /(PreMinor)|(PrePatch)|(Major)|(Minor)|(Patch)/
);
if (!parsedVersion) {
  return;
}
const whichVersion = parsedVersion[0].toLocaleLowerCase();

return whichVersion;



















const b = ' 123';
