(async () => {
    requestPermissions(JSON.stringify({ permissions: ["tonClient", "accountInteraction"] })).then((data) => console.log(`JS requestPermissions ${data}`));

    disconnect().then((_) => console.log(`JS disconnect`));

    subscribe(JSON.stringify({ address: "address", subscriptions: { state: true, transactions: true } })).then((data) => console.log(`JS subscribe ${data}`));

    unsubscribe(JSON.stringify({ address: "address" })).then((_) => console.log(`JS unsubscribe`));

    unsubscribeAll().then((_) => console.log(`JS unsubscribeAll`));

    getProviderState().then((data) => console.log(`JS getProviderState ${data}`));

    getFullContractState(JSON.stringify({ address: "address" })).then((data) => console.log(`JS getFullContractState ${data}`));

    getTransactions(JSON.stringify({
        address: "address",
        continuation: {
            lt: "lt",
            hash: "hash",
        },
        limit: 1,
    })).then((data) => console.log(`JS getTransactions ${data}`));

    runLocal(JSON.stringify({ address: "address", cachedState: { balance: "balance", genTimings: { genLt: "genLt", genUtime: 0 }, lastTransactionId: { isExact: true, lt: "lt", hash: "hash" }, isDeployed: true, boc: "boc" }, functionCall: { abi: "abi", method: "method", params: { "params": "params" } } })).then((data) => console.log(`JS runLocal ${data}`));

    getExpectedAddress(JSON.stringify({ tvc: "tvc", abi: "abi", workchain: 0, publicKey: "publicKey", initParams: { "initParams": "initParams" } })).then((data) => console.log(`JS getExpectedAddress ${data}`));

    packIntoCell(JSON.stringify({ structure: [{ name: "name", type: "type", components: [{ name: "name", type: "type", components: [] }] }], data: { "data": "data" } })).then((data) => console.log(`JS packIntoCell ${data}`));

    unpackFromCell(JSON.stringify({ structure: [{ name: "name", type: "type", components: [{ name: "name", type: "type", components: [] }] }], boc: "boc", allowPartial: true })).then((data) => console.log(`JS unpackFromCell ${data}`));

    extractPublicKey(JSON.stringify({ boc: "boc" })).then((data) => console.log(`JS extractPublicKey ${data}`));

    codeToTvc(JSON.stringify({ code: "code" })).then((data) => console.log(`JS codeToTvc ${data}`));

    splitTvc(JSON.stringify({ tvc: "tvc" })).then((data) => console.log(`JS splitTvc ${data}`));

    encodeInternalInput(JSON.stringify({ abi: "abi", method: "method", params: { "params": "params" } })).then((data) => console.log(`JS encodeInternalInput ${data}`));

    decodeInput(JSON.stringify({ body: "body", abi: "abi", method: "method", internal: true })).then((data) => console.log(`JS decodeInput ${data}`));

    decodeEvent(JSON.stringify({ body: "body", abi: "abi", event: "event" })).then((data) => console.log(`JS decodeEvent ${data}`));

    decodeOutput(JSON.stringify({ body: "body", abi: "abi", method: "method" })).then((data) => console.log(`JS decodeOutput ${data}`));

    decodeTransaction(JSON.stringify({
        transaction: {
            id: {
                lt: "lt",
                hash: "hash",
            },
            prevTransactionId: {
                lt: "lt",
                hash: "hash",
            },
            createdAt: 1234,
            aborted: false,
            origStatus: 'uninit',
            endStatus: 'uninit',
            totalFees: "totalFees",
            inMessage: {
                src: "src",
                dst: "dst",
                value: "value",
                bounce: false,
                bounced: false,
                body: "body",
                bodyHash: "bodyHash",
            },
            outMessages: [
                {
                    src: "src",
                    dst: "dst",
                    value: "value",
                    bounce: false,
                    bounced: false,
                    body: "body",
                    bodyHash: "bodyHash",
                },
            ],
        }, abi: "abi", method: "method"
    })).then((data) => console.log(`JS decodeTransaction ${data}`));

    decodeTransactionEvents(JSON.stringify({
        transaction: {
            id: {
                lt: "lt",
                hash: "hash",
            },
            prevTransactionId: {
                lt: "lt",
                hash: "hash",
            },
            createdAt: 1234,
            aborted: false,
            origStatus: 'uninit',
            endStatus: 'uninit',
            totalFees: "totalFees",
            inMessage: {
                src: "src",
                dst: "dst",
                value: "value",
                bounce: false,
                bounced: false,
                body: "body",
                bodyHash: "bodyHash",
            },
            outMessages: [
                {
                    src: "src",
                    dst: "dst",
                    value: "value",
                    bounce: false,
                    bounced: false,
                    body: "body",
                    bodyHash: "bodyHash",
                },
            ],
        }, abi: "abi"
    })).then((data) => console.log(`JS decodeTransactionEvents ${data}`));

    estimateFees(JSON.stringify({ sender: "sender", recipient: "recipient", amount: "amount", payload: { abi: "abi", method: "method", params: { "params": "params" } } })).then((data) => console.log(`JS estimateFees ${data}`));

    sendMessage(JSON.stringify({ sender: "sender", recipient: "recipient", amount: "amount", bounce: true, payload: { abi: "abi", method: "method", params: { "params": "params" } } })).then((data) => console.log(`JS sendMessage ${data}`));

    sendExternalMessage(JSON.stringify({ publicKey: "publicKey", recipient: "recipient", stateInit: "stateInit", payload: { abi: "abi", method: "method", params: { "params": "params" } } })).then((data) => console.log(`JS sendExternalMessage ${data}`));
})()
