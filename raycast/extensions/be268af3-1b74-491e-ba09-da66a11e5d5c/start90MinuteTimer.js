var c=Object.defineProperty;var T=Object.getOwnPropertyDescriptor;var d=Object.getOwnPropertyNames;var g=Object.prototype.hasOwnProperty;var y=t=>c(t,"__esModule",{value:!0});var S=(t,e)=>{for(var s in e)c(t,s,{get:e[s],enumerable:!0})},h=(t,e,s,i)=>{if(e&&typeof e=="object"||typeof e=="function")for(let r of d(e))!g.call(t,r)&&(s||r!=="default")&&c(t,r,{get:()=>e[r],enumerable:!(i=T(e,r))||i.enumerable});return t};var w=(t=>(e,s)=>t&&t.get(e)||(s=h(y({}),e,1),t&&t.set(e,s),s))(typeof WeakMap!="undefined"?new WeakMap:0);var N={};S(N,{default:()=>P});var a=require("@raycast/api");var n=require("@raycast/api"),f=require("child_process");var o=require("fs");var $=n.environment.supportPath+"/customTimers.json";async function l(t,e="Untitled"){let i=(n.environment.supportPath+"/"+new Date().toISOString()+"---"+t+".timer").replace(/:/g,"__");(0,o.writeFileSync)(i,e);let r=(0,n.getPreferenceValues)(),m=`sleep ${t} && if [ -f "${i}" ]; then `;r.selectedSound==="speak_timer_name"?m+=`say "${e}"`:m+=`afplay "${n.environment.assetsPath+"/"+r.selectedSound}"`,m+=` && osascript -e 'display notification "'"Timer complete"'" with title "Ding!"' && rm "${i}"; else echo "Timer deleted"; fi`,(0,f.exec)(m,(u,p)=>{if(u){console.log(`error: ${u.message}`);return}if(p){console.log(`stderr: ${p}`);return}})}var P=async()=>{await(0,a.closeMainWindow)(),await l(60*90),await(0,a.showHUD)("Timer started for 90 minutes! \u{1F389}")};module.exports=w(N);0&&(module.exports={});
