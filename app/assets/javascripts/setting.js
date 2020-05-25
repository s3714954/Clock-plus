document.addEventListener('turbolinks:load', ()=>{
    let classNames = ['personal-info', 'password', 'gravatar-setting', 'verification'];
    classNames.forEach(s=>{
        document.getElementById(s+"-btn").addEventListener('click', e=>{
            classNames.forEach(s=>{
                document.getElementById(s+"-btn").active = false;
                document.getElementById(s+"-tab").classList.add("d-none");
            })
            document.getElementById(s+"-btn").active = true;
            document.getElementById(s+"-tab").classList.remove("d-none");
        })
    })
    // defaults
    document.getElementById(classNames[0]+"-btn").active = true;
    for (let i=1; i<=classNames.length; i++) {
        document.getElementById(classNames[i]+"-tab").classList.add("d-none");
    }
}, false)