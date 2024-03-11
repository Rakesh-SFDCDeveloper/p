console.log('Inside');
const str = "NAM 300099";
let modifiedString = str.replace(/(NAM|EUR|ZAR|USD|\")/g, "");

console.log(modifiedString);