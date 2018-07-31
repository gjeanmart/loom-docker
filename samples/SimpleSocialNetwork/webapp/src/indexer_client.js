const http = require('http')

const indexerEndpoint = process.env.REACT_APP_INDEXER || "127.0.0.1:8081"
console.log("#######################")
console.log("indexerEndpoint="+indexerEndpoint)
console.log("#######################")

module.exports = {
  getIndexed
}

function getIndexed(type) {
  return new Promise((resolve, reject) => {
    function reqListener () {
      if (this.status == 200) {
        const result = JSON.parse(this.responseText).hits.hits
        resolve(result.map(result => result._source))
      } else {
        reject(Error('No results'))
      }
    }

    let oReq = new XMLHttpRequest()
    oReq.addEventListener('load', reqListener)
    oReq.open('GET', "http://"+indexerEndpoint + `/${type}`)
    oReq.send()
  })
}
