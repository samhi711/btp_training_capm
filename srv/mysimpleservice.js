const myservice = function(srv){
    srv.on('somesrv', (req,res) => {
     return "Hey" + req.data.msg;

    })
}

module.exports = myservice;