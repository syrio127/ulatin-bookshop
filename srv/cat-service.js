const cds = require('@sap/cds')
module.exports = async function (){

  const db = await cds.connect.to('db') // connect to database service
  const { Books } = db.entities         // get reflected definitions

  // Reduce stock of ordered books if available stock suffices
  this.on ('submitOrder', async req => {
    const {book,quantity} = req.data

    const n = await UPDATE (Books, book)
      .with ({ stock: {'-=': quantity }})
      .where ({ stock: {'>=': quantity }})
    n > 0 || req.error (409,`${quantity} exceeds stock for book #${book}`)
  })

//   //Reduce stock using ONLY using srv CREATE function for Orders Entity (not added)
//   srv.before ('CREATE', 'Orders', async (req) => {
//     const order = req.data
//     if (!order.amount || order.amount <= 0)  return req.error (400, 'Order at least 1 book')
//     const tx = cds.transaction(req)
//     const affectedRows = await tx.run (
//       UPDATE (Books)
//         .set   ({ stock: {'-=': order.amount}})
//         .where ({ stock: {'>=': order.amount}, and: { ID: order.book_ID}})
//     )
//     if (affectedRows === 0)  req.error (409, "Sold out, sorry")
//   })

  // Add some discount for overstocked books
  this.after ('READ','Books', each => {
    if (each.stock > 111)  each.title += ` -- 11% discount!`
  })
}
