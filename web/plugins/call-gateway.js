export default ({ app }, inject) => {
    inject('call', async (method, args) => {
        const resp = await fetch("/gateway", {
            method: "POST",
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify({
                jsonrpc: "2.0",
                method,
                params: [args],
                id: Math.floor(Math.random() * 99999)
            })
        });
        const body = await resp.json();
        console.debug("$call",method,args,body);
        if (resp.ok) {
            return Promise.resolve(body.result);
        } else {
            return Promise.reject(body.error);
        }
    });
}