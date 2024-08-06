module.exports = cds.service.impl( async function() {
    const {
   EmployeeSet
    } = this.entities;
    this.before('UPDATE', EmployeeSet, (req,res) => {
        console.log("kya hua", req.data.salaryAmount);
        if(parseFloat(req.data.salaryAmount) >= 1000000){
            req.error(500, "salary must be below 1mn");
        }
    });
});