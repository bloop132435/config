var vn=Object.create;var _=Object.defineProperty,En=Object.defineProperties,In=Object.getOwnPropertyDescriptor,Tn=Object.getOwnPropertyDescriptors,An=Object.getOwnPropertyNames,Te=Object.getOwnPropertySymbols,Pn=Object.getPrototypeOf,Pe=Object.prototype.hasOwnProperty,Cn=Object.prototype.propertyIsEnumerable;var Ae=(e,t,n)=>t in e?_(e,t,{enumerable:!0,configurable:!0,writable:!0,value:n}):e[t]=n,f=(e,t)=>{for(var n in t||(t={}))Pe.call(t,n)&&Ae(e,n,t[n]);if(Te)for(var n of Te(t))Cn.call(t,n)&&Ae(e,n,t[n]);return e},b=(e,t)=>En(e,Tn(t)),Ce=e=>_(e,"__esModule",{value:!0});var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),Gn=(e,t)=>{for(var n in t)_(e,n,{get:t[n],enumerable:!0})},Ge=(e,t,n,r)=>{if(t&&typeof t=="object"||typeof t=="function")for(let s of An(t))!Pe.call(e,s)&&(n||s!=="default")&&_(e,s,{get:()=>t[s],enumerable:!(r=In(t,s))||r.enumerable});return e},Oe=(e,t)=>Ge(Ce(_(e!=null?vn(Pn(e)):{},"default",!t&&e&&e.__esModule?{get:()=>e.default,enumerable:!0}:{value:e,enumerable:!0})),e),On=(e=>(t,n)=>e&&e.get(t)||(n=Ge(Ce({}),t,1),e&&e.set(t,n),n))(typeof WeakMap!="undefined"?new WeakMap:0);var $e=c((As,_e)=>{_e.exports=qe;qe.sync=Nn;var Re=require("fs");function Rn(e,t){var n=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!n||(n=n.split(";"),n.indexOf("")!==-1))return!0;for(var r=0;r<n.length;r++){var s=n[r].toLowerCase();if(s&&e.substr(-s.length).toLowerCase()===s)return!0}return!1}function Ne(e,t,n){return!e.isSymbolicLink()&&!e.isFile()?!1:Rn(t,n)}function qe(e,t,n){Re.stat(e,function(r,s){n(r,r?!1:Ne(s,e,t))})}function Nn(e,t){return Ne(Re.statSync(e),e,t)}});var je=c((Ps,Be)=>{Be.exports=Le;Le.sync=qn;var ke=require("fs");function Le(e,t,n){ke.stat(e,function(r,s){n(r,r?!1:Me(s,t))})}function qn(e,t){return Me(ke.statSync(e),t)}function Me(e,t){return e.isFile()&&_n(e,t)}function _n(e,t){var n=e.mode,r=e.uid,s=e.gid,o=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),u=parseInt("010",8),l=parseInt("001",8),p=a|u,y=n&l||n&u&&s===i||n&a&&r===o||n&p&&o===0;return y}});var Ue=c((Gs,Fe)=>{var Cs=require("fs"),U;process.platform==="win32"||global.TESTING_WINDOWS?U=$e():U=je();Fe.exports=ee;ee.sync=$n;function ee(e,t,n){if(typeof t=="function"&&(n=t,t={}),!n){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(r,s){ee(e,t||{},function(o,i){o?s(o):r(i)})})}U(e,t||{},function(r,s){r&&(r.code==="EACCES"||t&&t.ignoreErrors)&&(r=null,s=!1),n(r,s)})}function $n(e,t){try{return U.sync(e,t||{})}catch(n){if(t&&t.ignoreErrors||n.code==="EACCES")return!1;throw n}}});var Ve=c((Os,ze)=>{var A=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",De=require("path"),kn=A?";":":",He=Ue(),Xe=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Ke=(e,t)=>{let n=t.colon||kn,r=e.match(/\//)||A&&e.match(/\\/)?[""]:[...A?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(n)],s=A?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",o=A?s.split(n):[""];return A&&e.indexOf(".")!==-1&&o[0]!==""&&o.unshift(""),{pathEnv:r,pathExt:o,pathExtExe:s}},We=(e,t,n)=>{typeof t=="function"&&(n=t,t={}),t||(t={});let{pathEnv:r,pathExt:s,pathExtExe:o}=Ke(e,t),i=[],a=l=>new Promise((p,y)=>{if(l===r.length)return t.all&&i.length?p(i):y(Xe(e));let h=r[l],S=/^".*"$/.test(h)?h.slice(1,-1):h,g=De.join(S,e),x=!S&&/^\.[\\\/]/.test(e)?e.slice(0,2)+g:g;p(u(x,l,0))}),u=(l,p,y)=>new Promise((h,S)=>{if(y===s.length)return h(a(p+1));let g=s[y];He(l+g,{pathExt:o},(x,T)=>{if(!x&&T)if(t.all)i.push(l+g);else return h(l+g);return h(u(l,p,y+1))})});return n?a(0).then(l=>n(null,l),n):a(0)},Ln=(e,t)=>{t=t||{};let{pathEnv:n,pathExt:r,pathExtExe:s}=Ke(e,t),o=[];for(let i=0;i<n.length;i++){let a=n[i],u=/^".*"$/.test(a)?a.slice(1,-1):a,l=De.join(u,e),p=!u&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let y=0;y<r.length;y++){let h=p+r[y];try{if(He.sync(h,{pathExt:s}))if(t.all)o.push(h);else return h}catch{}}}if(t.all&&o.length)return o;if(t.nothrow)return null;throw Xe(e)};ze.exports=We;We.sync=Ln});var ne=c((Rs,te)=>{"use strict";var Ye=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(r=>r.toUpperCase()==="PATH")||"Path"};te.exports=Ye;te.exports.default=Ye});var et=c((Ns,Je)=>{"use strict";var Qe=require("path"),Mn=Ve(),Bn=ne();function Ze(e,t){let n=e.options.env||process.env,r=process.cwd(),s=e.options.cwd!=null,o=s&&process.chdir!==void 0&&!process.chdir.disabled;if(o)try{process.chdir(e.options.cwd)}catch{}let i;try{i=Mn.sync(e.command,{path:n[Bn({env:n})],pathExt:t?Qe.delimiter:void 0})}catch{}finally{o&&process.chdir(r)}return i&&(i=Qe.resolve(s?e.options.cwd:"",i)),i}function jn(e){return Ze(e)||Ze(e,!0)}Je.exports=jn});var tt=c((qs,se)=>{"use strict";var re=/([()\][%!^"`<>&|;, *?])/g;function Fn(e){return e=e.replace(re,"^$1"),e}function Un(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(re,"^$1"),t&&(e=e.replace(re,"^$1")),e}se.exports.command=Fn;se.exports.argument=Un});var rt=c((_s,nt)=>{"use strict";nt.exports=/^#!(.*)/});var ot=c(($s,st)=>{"use strict";var Dn=rt();st.exports=(e="")=>{let t=e.match(Dn);if(!t)return null;let[n,r]=t[0].replace(/#! ?/,"").split(" "),s=n.split("/").pop();return s==="env"?r:r?`${s} ${r}`:s}});var at=c((ks,it)=>{"use strict";var oe=require("fs"),Hn=ot();function Xn(e){let n=Buffer.alloc(150),r;try{r=oe.openSync(e,"r"),oe.readSync(r,n,0,150,0),oe.closeSync(r)}catch{}return Hn(n.toString())}it.exports=Xn});var dt=c((Ls,lt)=>{"use strict";var Kn=require("path"),ct=et(),ut=tt(),Wn=at(),zn=process.platform==="win32",Vn=/\.(?:com|exe)$/i,Yn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Qn(e){e.file=ct(e);let t=e.file&&Wn(e.file);return t?(e.args.unshift(e.file),e.command=t,ct(e)):e.file}function Zn(e){if(!zn)return e;let t=Qn(e),n=!Vn.test(t);if(e.options.forceShell||n){let r=Yn.test(t);e.command=Kn.normalize(e.command),e.command=ut.command(e.command),e.args=e.args.map(o=>ut.argument(o,r));let s=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${s}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Jn(e,t,n){t&&!Array.isArray(t)&&(n=t,t=null),t=t?t.slice(0):[],n=Object.assign({},n);let r={command:e,args:t,options:n,file:void 0,original:{command:e,args:t}};return n.shell?r:Zn(r)}lt.exports=Jn});var mt=c((Ms,pt)=>{"use strict";var ie=process.platform==="win32";function ae(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function er(e,t){if(!ie)return;let n=e.emit;e.emit=function(r,s){if(r==="exit"){let o=ft(s,t,"spawn");if(o)return n.call(e,"error",o)}return n.apply(e,arguments)}}function ft(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawn"):null}function tr(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawnSync"):null}pt.exports={hookChildProcess:er,verifyENOENT:ft,verifyENOENTSync:tr,notFoundError:ae}});var St=c((Bs,P)=>{"use strict";var ht=require("child_process"),ce=dt(),ue=mt();function yt(e,t,n){let r=ce(e,t,n),s=ht.spawn(r.command,r.args,r.options);return ue.hookChildProcess(s,r),s}function nr(e,t,n){let r=ce(e,t,n),s=ht.spawnSync(r.command,r.args,r.options);return s.error=s.error||ue.verifyENOENTSync(s.status,r),s}P.exports=yt;P.exports.spawn=yt;P.exports.sync=nr;P.exports._parse=ce;P.exports._enoent=ue});var xt=c((js,gt)=>{"use strict";gt.exports=e=>{let t=typeof e=="string"?`
`:`
`.charCodeAt(),n=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===n&&(e=e.slice(0,e.length-1)),e}});var vt=c((Fs,k)=>{"use strict";var $=require("path"),wt=ne(),bt=e=>{e=f({cwd:process.cwd(),path:process.env[wt()],execPath:process.execPath},e);let t,n=$.resolve(e.cwd),r=[];for(;t!==n;)r.push($.join(n,"node_modules/.bin")),t=n,n=$.resolve(n,"..");let s=$.resolve(e.cwd,e.execPath,"..");return r.push(s),r.concat(e.path).join($.delimiter)};k.exports=bt;k.exports.default=bt;k.exports.env=e=>{e=f({env:process.env},e);let t=f({},e.env),n=wt({env:t});return e.path=t[n],t[n]=k.exports(e),t}});var It=c((Us,le)=>{"use strict";var Et=(e,t)=>{for(let n of Reflect.ownKeys(t))Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n));return e};le.exports=Et;le.exports.default=Et});var At=c((Ds,H)=>{"use strict";var rr=It(),D=new WeakMap,Tt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let n,r=0,s=e.displayName||e.name||"<anonymous>",o=function(...i){if(D.set(o,++r),r===1)n=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${s}\` can only be called once`);return n};return rr(o,e),D.set(o,r),o};H.exports=Tt;H.exports.default=Tt;H.exports.callCount=e=>{if(!D.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return D.get(e)}});var Pt=c(X=>{"use strict";Object.defineProperty(X,"__esModule",{value:!0});X.SIGNALS=void 0;var sr=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];X.SIGNALS=sr});var de=c(C=>{"use strict";Object.defineProperty(C,"__esModule",{value:!0});C.SIGRTMAX=C.getRealtimeSignals=void 0;var or=function(){let e=Gt-Ct+1;return Array.from({length:e},ir)};C.getRealtimeSignals=or;var ir=function(e,t){return{name:`SIGRT${t+1}`,number:Ct+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},Ct=34,Gt=64;C.SIGRTMAX=Gt});var Ot=c(K=>{"use strict";Object.defineProperty(K,"__esModule",{value:!0});K.getSignals=void 0;var ar=require("os"),cr=Pt(),ur=de(),lr=function(){let e=(0,ur.getRealtimeSignals)();return[...cr.SIGNALS,...e].map(dr)};K.getSignals=lr;var dr=function({name:e,number:t,description:n,action:r,forced:s=!1,standard:o}){let{signals:{[e]:i}}=ar.constants,a=i!==void 0;return{name:e,number:a?i:t,description:n,supported:a,action:r,forced:s,standard:o}}});var Nt=c(G=>{"use strict";Object.defineProperty(G,"__esModule",{value:!0});G.signalsByNumber=G.signalsByName=void 0;var fr=require("os"),Rt=Ot(),pr=de(),mr=function(){return(0,Rt.getSignals)().reduce(hr,{})},hr=function(e,{name:t,number:n,description:r,supported:s,action:o,forced:i,standard:a}){return b(f({},e),{[t]:{name:t,number:n,description:r,supported:s,action:o,forced:i,standard:a}})},yr=mr();G.signalsByName=yr;var Sr=function(){let e=(0,Rt.getSignals)(),t=pr.SIGRTMAX+1,n=Array.from({length:t},(r,s)=>gr(s,e));return Object.assign({},...n)},gr=function(e,t){let n=xr(e,t);if(n===void 0)return{};let{name:r,description:s,supported:o,action:i,forced:a,standard:u}=n;return{[e]:{name:r,number:e,description:s,supported:o,action:i,forced:a,standard:u}}},xr=function(e,t){let n=t.find(({name:r})=>fr.constants.signals[r]===e);return n!==void 0?n:t.find(r=>r.number===e)},wr=Sr();G.signalsByNumber=wr});var _t=c((zs,qt)=>{"use strict";var{signalsByName:br}=Nt(),vr=({timedOut:e,timeout:t,errorCode:n,signal:r,signalDescription:s,exitCode:o,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":n!==void 0?`failed with ${n}`:r!==void 0?`was killed with ${r} (${s})`:o!==void 0?`failed with exit code ${o}`:"failed",Er=({stdout:e,stderr:t,all:n,error:r,signal:s,exitCode:o,command:i,escapedCommand:a,timedOut:u,isCanceled:l,killed:p,parsed:{options:{timeout:y}}})=>{o=o===null?void 0:o,s=s===null?void 0:s;let h=s===void 0?void 0:br[s].description,S=r&&r.code,x=`Command ${vr({timedOut:u,timeout:y,errorCode:S,signal:s,signalDescription:h,exitCode:o,isCanceled:l})}: ${i}`,T=Object.prototype.toString.call(r)==="[object Error]",j=T?`${x}
${r.message}`:x,F=[j,t,e].filter(Boolean).join(`
`);return T?(r.originalMessage=r.message,r.message=F):r=new Error(F),r.shortMessage=j,r.command=i,r.escapedCommand=a,r.exitCode=o,r.signal=s,r.signalDescription=h,r.stdout=e,r.stderr=t,n!==void 0&&(r.all=n),"bufferedData"in r&&delete r.bufferedData,r.failed=!0,r.timedOut=Boolean(u),r.isCanceled=l,r.killed=p&&!u,r};qt.exports=Er});var kt=c((Vs,fe)=>{"use strict";var W=["stdin","stdout","stderr"],Ir=e=>W.some(t=>e[t]!==void 0),$t=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return W.map(r=>e[r]);if(Ir(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${W.map(r=>`\`${r}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let n=Math.max(t.length,W.length);return Array.from({length:n},(r,s)=>t[s])};fe.exports=$t;fe.exports.node=e=>{let t=$t(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Lt=c((Ys,z)=>{z.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&z.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&z.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var Ut=c((Qs,N)=>{var d=global.process,E=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};E(d)?(Mt=require("assert"),O=Lt(),Bt=/^win/i.test(d.platform),L=require("events"),typeof L!="function"&&(L=L.EventEmitter),d.__signal_exit_emitter__?m=d.__signal_exit_emitter__:(m=d.__signal_exit_emitter__=new L,m.count=0,m.emitted={}),m.infinite||(m.setMaxListeners(1/0),m.infinite=!0),N.exports=function(e,t){if(!E(global.process))return function(){};Mt.equal(typeof e,"function","a callback must be provided for exit handler"),R===!1&&pe();var n="exit";t&&t.alwaysLast&&(n="afterexit");var r=function(){m.removeListener(n,e),m.listeners("exit").length===0&&m.listeners("afterexit").length===0&&V()};return m.on(n,e),r},V=function(){!R||!E(global.process)||(R=!1,O.forEach(function(t){try{d.removeListener(t,Y[t])}catch{}}),d.emit=Q,d.reallyExit=me,m.count-=1)},N.exports.unload=V,I=function(t,n,r){m.emitted[t]||(m.emitted[t]=!0,m.emit(t,n,r))},Y={},O.forEach(function(e){Y[e]=function(){if(!!E(global.process)){var n=d.listeners(e);n.length===m.count&&(V(),I("exit",null,e),I("afterexit",null,e),Bt&&e==="SIGHUP"&&(e="SIGINT"),d.kill(d.pid,e))}}}),N.exports.signals=function(){return O},R=!1,pe=function(){R||!E(global.process)||(R=!0,m.count+=1,O=O.filter(function(t){try{return d.on(t,Y[t]),!0}catch{return!1}}),d.emit=Ft,d.reallyExit=jt)},N.exports.load=pe,me=d.reallyExit,jt=function(t){!E(global.process)||(d.exitCode=t||0,I("exit",d.exitCode,null),I("afterexit",d.exitCode,null),me.call(d,d.exitCode))},Q=d.emit,Ft=function(t,n){if(t==="exit"&&E(global.process)){n!==void 0&&(d.exitCode=n);var r=Q.apply(this,arguments);return I("exit",d.exitCode,null),I("afterexit",d.exitCode,null),r}else return Q.apply(this,arguments)}):N.exports=function(){return function(){}};var Mt,O,Bt,L,m,V,I,Y,R,pe,me,jt,Q,Ft});var Ht=c((Zs,Dt)=>{"use strict";var Tr=require("os"),Ar=Ut(),Pr=1e3*5,Cr=(e,t="SIGTERM",n={})=>{let r=e(t);return Gr(e,t,n,r),r},Gr=(e,t,n,r)=>{if(!Or(t,n,r))return;let s=Nr(n),o=setTimeout(()=>{e("SIGKILL")},s);o.unref&&o.unref()},Or=(e,{forceKillAfterTimeout:t},n)=>Rr(e)&&t!==!1&&n,Rr=e=>e===Tr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",Nr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return Pr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},qr=(e,t)=>{e.kill()&&(t.isCanceled=!0)},_r=(e,t,n)=>{e.kill(t),n(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},$r=(e,{timeout:t,killSignal:n="SIGTERM"},r)=>{if(t===0||t===void 0)return r;let s,o=new Promise((a,u)=>{s=setTimeout(()=>{_r(e,n,u)},t)}),i=r.finally(()=>{clearTimeout(s)});return Promise.race([o,i])},kr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Lr=async(e,{cleanup:t,detached:n},r)=>{if(!t||n)return r;let s=Ar(()=>{e.kill()});return r.finally(()=>{s()})};Dt.exports={spawnedKill:Cr,spawnedCancel:qr,setupTimeout:$r,validateTimeout:kr,setExitHandler:Lr}});var Kt=c((Js,Xt)=>{"use strict";var w=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";w.writable=e=>w(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";w.readable=e=>w(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";w.duplex=e=>w.writable(e)&&w.readable(e);w.transform=e=>w.duplex(e)&&typeof e._transform=="function";Xt.exports=w});var zt=c((eo,Wt)=>{"use strict";var{PassThrough:Mr}=require("stream");Wt.exports=e=>{e=f({},e);let{array:t}=e,{encoding:n}=e,r=n==="buffer",s=!1;t?s=!(n||r):n=n||"utf8",r&&(n=null);let o=new Mr({objectMode:s});n&&o.setEncoding(n);let i=0,a=[];return o.on("data",u=>{a.push(u),s?i=a.length:i+=u.length}),o.getBufferedValue=()=>t?a:r?Buffer.concat(a,i):a.join(""),o.getBufferedLength=()=>i,o}});var Vt=c((to,M)=>{"use strict";var{constants:Br}=require("buffer"),jr=require("stream"),{promisify:Fr}=require("util"),Ur=zt(),Dr=Fr(jr.pipeline),he=class extends Error{constructor(){super("maxBuffer exceeded");this.name="MaxBufferError"}};async function ye(e,t){if(!e)throw new Error("Expected a stream");t=f({maxBuffer:1/0},t);let{maxBuffer:n}=t,r=Ur(t);return await new Promise((s,o)=>{let i=a=>{a&&r.getBufferedLength()<=Br.MAX_LENGTH&&(a.bufferedData=r.getBufferedValue()),o(a)};(async()=>{try{await Dr(e,r),s()}catch(a){i(a)}})(),r.on("data",()=>{r.getBufferedLength()>n&&i(new he)})}),r.getBufferedValue()}M.exports=ye;M.exports.buffer=(e,t)=>ye(e,b(f({},t),{encoding:"buffer"}));M.exports.array=(e,t)=>ye(e,b(f({},t),{array:!0}));M.exports.MaxBufferError=he});var Qt=c((no,Yt)=>{"use strict";var{PassThrough:Hr}=require("stream");Yt.exports=function(){var e=[],t=new Hr({objectMode:!0});return t.setMaxListeners(0),t.add=n,t.isEmpty=r,t.on("unpipe",s),Array.prototype.slice.call(arguments).forEach(n),t;function n(o){return Array.isArray(o)?(o.forEach(n),this):(e.push(o),o.once("end",s.bind(null,o)),o.once("error",t.emit.bind(t,"error")),o.pipe(t,{end:!1}),this)}function r(){return e.length==0}function s(o){e=e.filter(function(i){return i!==o}),!e.length&&t.readable&&t.end()}}});var tn=c((ro,en)=>{"use strict";var Jt=Kt(),Zt=Vt(),Xr=Qt(),Kr=(e,t)=>{t===void 0||e.stdin===void 0||(Jt(t)?t.pipe(e.stdin):e.stdin.end(t))},Wr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let n=Xr();return e.stdout&&n.add(e.stdout),e.stderr&&n.add(e.stderr),n},Se=async(e,t)=>{if(!!e){e.destroy();try{return await t}catch(n){return n.bufferedData}}},ge=(e,{encoding:t,buffer:n,maxBuffer:r})=>{if(!(!e||!n))return t?Zt(e,{encoding:t,maxBuffer:r}):Zt.buffer(e,{maxBuffer:r})},zr=async({stdout:e,stderr:t,all:n},{encoding:r,buffer:s,maxBuffer:o},i)=>{let a=ge(e,{encoding:r,buffer:s,maxBuffer:o}),u=ge(t,{encoding:r,buffer:s,maxBuffer:o}),l=ge(n,{encoding:r,buffer:s,maxBuffer:o*2});try{return await Promise.all([i,a,u,l])}catch(p){return Promise.all([{error:p,signal:p.signal,timedOut:p.timedOut},Se(e,a),Se(t,u),Se(n,l)])}},Vr=({input:e})=>{if(Jt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};en.exports={handleInput:Kr,makeAllStream:Wr,getSpawnedResult:zr,validateInputSync:Vr}});var rn=c((so,nn)=>{"use strict";var Yr=(async()=>{})().constructor.prototype,Qr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(Yr,e)]),Zr=(e,t)=>{for(let[n,r]of Qr){let s=typeof t=="function"?(...o)=>Reflect.apply(r.value,t(),o):r.value.bind(t);Reflect.defineProperty(e,n,b(f({},r),{value:s}))}return e},Jr=e=>new Promise((t,n)=>{e.on("exit",(r,s)=>{t({exitCode:r,signal:s})}),e.on("error",r=>{n(r)}),e.stdin&&e.stdin.on("error",r=>{n(r)})});nn.exports={mergePromise:Zr,getSpawnedPromise:Jr}});var an=c((oo,on)=>{"use strict";var sn=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],es=/^[\w.-]+$/,ts=/"/g,ns=e=>typeof e!="string"||es.test(e)?e:`"${e.replace(ts,'\\"')}"`,rs=(e,t)=>sn(e,t).join(" "),ss=(e,t)=>sn(e,t).map(n=>ns(n)).join(" "),os=/ +/g,is=e=>{let t=[];for(let n of e.trim().split(os)){let r=t[t.length-1];r&&r.endsWith("\\")?t[t.length-1]=`${r.slice(0,-1)} ${n}`:t.push(n)}return t};on.exports={joinCommand:rs,getEscapedCommand:ss,parseCommand:is}});var mn=c((io,q)=>{"use strict";var as=require("path"),xe=require("child_process"),cs=St(),us=xt(),ls=vt(),ds=At(),Z=_t(),un=kt(),{spawnedKill:fs,spawnedCancel:ps,setupTimeout:ms,validateTimeout:hs,setExitHandler:ys}=Ht(),{handleInput:Ss,getSpawnedResult:gs,makeAllStream:xs,validateInputSync:ws}=tn(),{mergePromise:cn,getSpawnedPromise:bs}=rn(),{joinCommand:ln,parseCommand:dn,getEscapedCommand:fn}=an(),vs=1e3*1e3*100,Es=({env:e,extendEnv:t,preferLocal:n,localDir:r,execPath:s})=>{let o=t?f(f({},process.env),e):e;return n?ls.env({env:o,cwd:r,execPath:s}):o},pn=(e,t,n={})=>{let r=cs._parse(e,t,n);return e=r.command,t=r.args,n=r.options,n=f({maxBuffer:vs,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:n.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0},n),n.env=Es(n),n.stdio=un(n),process.platform==="win32"&&as.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:n,parsed:r}},B=(e,t,n)=>typeof t!="string"&&!Buffer.isBuffer(t)?n===void 0?void 0:"":e.stripFinalNewline?us(t):t,J=(e,t,n)=>{let r=pn(e,t,n),s=ln(e,t),o=fn(e,t);hs(r.options);let i;try{i=xe.spawn(r.file,r.args,r.options)}catch(S){let g=new xe.ChildProcess,x=Promise.reject(Z({error:S,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:r,timedOut:!1,isCanceled:!1,killed:!1}));return cn(g,x)}let a=bs(i),u=ms(i,r.options,a),l=ys(i,r.options,u),p={isCanceled:!1};i.kill=fs.bind(null,i.kill.bind(i)),i.cancel=ps.bind(null,i,p);let h=ds(async()=>{let[{error:S,exitCode:g,signal:x,timedOut:T},j,F,bn]=await gs(i,r.options,l),be=B(r.options,j),ve=B(r.options,F),Ee=B(r.options,bn);if(S||g!==0||x!==null){let Ie=Z({error:S,exitCode:g,signal:x,stdout:be,stderr:ve,all:Ee,command:s,escapedCommand:o,parsed:r,timedOut:T,isCanceled:p.isCanceled,killed:i.killed});if(!r.options.reject)return Ie;throw Ie}return{command:s,escapedCommand:o,exitCode:0,stdout:be,stderr:ve,all:Ee,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return Ss(i,r.options.input),i.all=xs(i,r.options),cn(i,h)};q.exports=J;q.exports.sync=(e,t,n)=>{let r=pn(e,t,n),s=ln(e,t),o=fn(e,t);ws(r.options);let i;try{i=xe.spawnSync(r.file,r.args,r.options)}catch(l){throw Z({error:l,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:r,timedOut:!1,isCanceled:!1,killed:!1})}let a=B(r.options,i.stdout,i.error),u=B(r.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let l=Z({stdout:a,stderr:u,error:i.error,signal:i.signal,exitCode:i.status,command:s,escapedCommand:o,parsed:r,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!r.options.reject)return l;throw l}return{command:s,escapedCommand:o,exitCode:0,stdout:a,stderr:u,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};q.exports.command=(e,t)=>{let[n,...r]=dn(e);return J(n,r,t)};q.exports.commandSync=(e,t)=>{let[n,...r]=dn(e);return J.sync(n,r,t)};q.exports.node=(e,t,n={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(n=t,t=[]);let r=un.node(n),s=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:o=process.execPath,nodeOptions:i=s}=n;return J(o,[...i,e,...Array.isArray(t)?t:[]],b(f({},n),{stdin:void 0,stdout:void 0,stderr:void 0,stdio:r,shell:!1}))}});var Is={};Gn(Is,{default:()=>wn});var v=require("@raycast/api");var hn=Oe(require("node:process"),1),yn=Oe(mn(),1);async function we(e){if(hn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,yn.default)("osascript",["-e",e]);return t}var Sn=require("@raycast/api");async function gn(){return!!(await(0,Sn.getApplications)()).find(n=>n.bundleId==="com.if.Amphetamine")}var xn="https://apps.apple.com/br/app/amphetamine/id937984704";async function wn(e){let t=e?.duration,n=e?.interval,r=t===1?n?.substring(0,n.length-1):n,s=new v.Toast({title:"Starting a new session",style:v.Toast.Style.Animated});return s.show(),await gn()?await we(`
    tell application "Amphetamine"
    		return session is active
    end tell
  `)==="true"?(s.title="A session is already running",s.style=v.Toast.Style.Failure,!1):(await we(`
    tell application "Amphetamine"
        start new session ${t?`with options {duration: ${t}, interval: ${n}, displaySleepAllowed: false}`:""}
    end tell
  `),await(0,v.showHUD)(t?`New session started with ${t} ${r}`:"New default session started"),!0):(s.title="Amphetamine is no installed",s.message="Press Command + D to download",s.primaryAction={title:"Download",shortcut:{modifiers:["cmd"],key:"d"},onAction:async()=>await(0,v.open)(xn)},s.style=v.Toast.Style.Failure,!1)}module.exports=On(Is);0&&(module.exports={});