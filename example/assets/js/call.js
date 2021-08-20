(async () => {
    requestPermissions('{json:json}').then((data) => console.log(`JS requestPermissions ${data}`));

    disconnect('{json:json}').then((data) => console.log(`JS disconnect ${data}`));

    subscribe('{json:json}').then((data) => console.log(`JS subscribe ${data}`));

    unsubscribe('{json:json}').then((data) => console.log(`JS unsubscribe ${data}`));

    unsubscribeAll('{json:json}').then((data) => console.log(`JS unsubscribeAll ${data}`));

    getProviderState('{json:json}').then((data) => console.log(`JS getProviderState ${data}`));

    getFullContractState('{json:json}').then((data) => console.log(`JS getFullContractState ${data}`));

    getTransactions('{json:json}').then((data) => console.log(`JS getTransactions ${data}`));

    runLocal('{json:json}').then((data) => console.log(`JS runLocal ${data}`));

    getExpectedAddress('{json:json}').then((data) => console.log(`JS getExpectedAddress ${data}`));

    packIntoCell('{json:json}').then((data) => console.log(`JS packIntoCell ${data}`));

    unpackFromCell('{json:json}').then((data) => console.log(`JS unpackFromCell ${data}`));

    extractPublicKey('{json:json}').then((data) => console.log(`JS extractPublicKey ${data}`));

    codeToTvc('{json:json}').then((data) => console.log(`JS codeToTvc ${data}`));

    splitTvc('{json:json}').then((data) => console.log(`JS splitTvc ${data}`));

    encodeInternalInput('{json:json}').then((data) => console.log(`JS encodeInternalInput ${data}`));

    decodeInput('{json:json}').then((data) => console.log(`JS decodeInput ${data}`));

    decodeEvent('{json:json}').then((data) => console.log(`JS decodeEvent ${data}`));

    decodeOutput('{json:json}').then((data) => console.log(`JS decodeOutput ${data}`));

    decodeTransaction('{json:json}').then((data) => console.log(`JS decodeTransaction ${data}`));

    decodeTransactionEvents('{json:json}').then((data) => console.log(`JS decodeTransactionEvents ${data}`));

    estimateFees('{json:json}').then((data) => console.log(`JS estimateFees ${data}`));

    sendMessage('{json:json}').then((data) => console.log(`JS sendMessage ${data}`));

    sendExternalMessage('{json:json}').then((data) => console.log(`JS sendExternalMessage ${data}`));
})()
