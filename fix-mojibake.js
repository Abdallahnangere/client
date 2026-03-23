const fs = require('fs');
const path = 'app/globals.css';
const content = fs.readFileSync(path, 'utf8');

const fixed = content
  .replace(/â€"/g, '—')      // em dash
  .replace(/â"€/g, '─')      // horizontal line
  .replace(/â€¦/g, '…')      // ellipsis  
  .replace(/Â·/g, '·')       // middle dot
  .replace(/âˆ'/g, '-')      // minus
  .replace(/â€º/g, '›');     // right angle

fs.writeFileSync(path, fixed, 'utf8');
console.log('✓ globals.css mojibake fixed');
