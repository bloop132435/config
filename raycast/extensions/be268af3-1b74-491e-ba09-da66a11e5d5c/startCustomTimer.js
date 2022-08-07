var u=Object.defineProperty;var y=Object.getOwnPropertyDescriptor;var g=Object.getOwnPropertyNames;var N=Object.prototype.hasOwnProperty;var b=i=>u(i,"__esModule",{value:!0});var P=(i,s)=>{for(var n in s)u(i,n,{get:s[n],enumerable:!0})},O=(i,s,n,e)=>{if(s&&typeof s=="object"||typeof s=="function")for(let r of g(s))!N.call(i,r)&&(n||r!=="default")&&u(i,r,{get:()=>s[r],enumerable:!(e=y(s,r))||e.enumerable});return i};var $=(i=>(s,n)=>i&&i.get(s)||(n=O(b({}),s,1),i&&i.set(s,n),n))(typeof WeakMap!="undefined"?new WeakMap:0);var C={};P(C,{default:()=>w});var t=require("@raycast/api");var a=require("@raycast/api"),l=require("child_process"),T=require("crypto"),o=require("fs");var c=a.environment.supportPath+"/customTimers.json";async function h(i,s="Untitled"){let e=(a.environment.supportPath+"/"+new Date().toISOString()+"---"+i+".timer").replace(/:/g,"__");(0,o.writeFileSync)(e,s);let r=(0,a.getPreferenceValues)(),m=`sleep ${i} && if [ -f "${e}" ]; then `;r.selectedSound==="speak_timer_name"?m+=`say "${s}"`:m+=`afplay "${a.environment.assetsPath+"/"+r.selectedSound}"`,m+=` && osascript -e 'display notification "'"Timer complete"'" with title "Ding!"' && rm "${e}"; else echo "Timer deleted"; fi`,(0,l.exec)(m,(d,p)=>{if(d){console.log(`error: ${d.message}`);return}if(p){console.log(`stderr: ${p}`);return}})}async function f(){(0,o.existsSync)(c)||(0,o.writeFileSync)(c,JSON.stringify({}))}async function S(i){await f();let s=JSON.parse((0,o.readFileSync)(c,"utf8"));s[(0,T.randomUUID)()]=i,(0,o.writeFileSync)(c,JSON.stringify(s))}function w(){let i=async e=>{if(await f(),e.hours===""&&e.minutes===""&&e.seconds==="")await new t.Toast({style:t.Toast.Style.Failure,title:"No values set for timer length!"}).show();else if(isNaN(Number(e.hours)))await new t.Toast({style:t.Toast.Style.Failure,title:"Hours must be a number!"}).show();else if(isNaN(Number(e.minutes)))await new t.Toast({style:t.Toast.Style.Failure,title:"Minutes must be a number!"}).show();else if(isNaN(Number(e.seconds)))await new t.Toast({style:t.Toast.Style.Failure,title:"Seconds must be a number!"}).show();else{await(0,t.closeMainWindow)();let r=e.name?e.name:"Untitled",m=3600*Number(e.hours)+60*Number(e.minutes)+Number(e.seconds);await h(m,r),e.willBeSaved&&S({name:e.name,timeInSeconds:m}),await(0,t.showHUD)(`Timer "${r}" started for ${e.hours?e.hours:0}h${e.minutes?e.minutes:0}m${e.seconds?e.seconds:0}s! \u{1F389}`),await(0,t.popToRoot)()}},s=[{id:"hours",title:"Hours",placeholder:"0"},{id:"minutes",title:"Minutes",placeholder:"00"},{id:"seconds",title:"Seconds",placeholder:"00"}];return(0,t.getPreferenceValues)().newTimerInputOrder!=="hhmmss"&&s.reverse(),_jsx(t.Form,{actions:_jsx(t.ActionPanel,null,_jsx(t.Action.SubmitForm,{title:"Start Custom Timer",onSubmit:async e=>i(e)}))},s.map((e,r)=>_jsx(t.Form.TextField,{key:r,id:e.id,title:e.title,placeholder:e.placeholder})),_jsx(t.Form.TextField,{id:"name",title:"Name",placeholder:"Pour Tea"}),_jsx(t.Form.Checkbox,{id:"willBeSaved",label:"Save as preset"}))}module.exports=$(C);0&&(module.exports={});
