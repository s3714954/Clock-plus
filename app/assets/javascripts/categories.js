document.addEventListener('turbolinks:load', ()=>{ 
    document.querySelectorAll(".filter").forEach( el=>{
        el.addEventListener("click", ev=>{
            let url = new URL(document.location);
            if (ev.target.classList.contains("active")) {
                ev.target.classList.remove("active");
            } else {
                ev.target.classList.add("active");
            }
            url.searchParams.delete("category[]");
            document.querySelectorAll(".filter.active").forEach( el2=> {
                url.searchParams.append("category[]", el2.value);
            })
            url.searchParams.append("filtered", 1);
            document.location = url;
        })
    })

    document.querySelectorAll(".to-recent").forEach( el=>{
        el.addEventListener("click", ev=>{
            let url = new URL(document.location);
            url.searchParams.delete("filtered");
            document.location = url;  
        })
    })

    document.querySelectorAll(".to-filtered").forEach( el=>{
        el.addEventListener("click", ev=>{
            let url = new URL(document.location);
            url.searchParams.append("filtered", 1);
            document.location = url;
        })
    })
}, false)