var paypal=require('paypal-rest-sdk');
var express=require('express');
var app = express();
var amount =0;

var bodyparser=require('body-parser');

app.use(
    bodyparser.urlencoded({
        extended:false
    })
);

app.post('/pay',(req,res)=>{

    amount=req.body.price;

var create_payment_json = {
    "intent": "sale",
    "payer": {
        "payment_method": "paypal"
    },
    "redirect_urls": {
        "return_url": "http://localhost:8000/success",
        "cancel_url": "http://cancel.url"
    },
    "transactions": [{
        "item_list": {
            "items": [{
                "name": "item",
                "sku": "item",
                "price": amount,
                "currency": "USD",
                "quantity": 1
            }]
        },
        "amount": {
            "currency": "USD",
            "total": amount
        },
        "description": "This is the payment description."
    }]
};


paypal.payment.create(create_payment_json, function (error, payment) {
    if (error) {
        throw error;
    } else {
        console.log("Create Payment Response");
        console.log(payment);

        for(let i=0;i<payment.links.length;i++){

            if(payment.links[i].rel=='approval_url'){
                res.redirect(payment.links[i].href);
            }
        }
    }
});

});

app.get('/success',(req,res)=>{

    var execute_payment_json = {
        "payer_id":req.query.PayerID,
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": amount
            }
        }]
    };

    var paymentId = req.query.paymentId;

paypal.payment.execute(paymentId, execute_payment_json, function (error, payment) {
    if (error) {
        console.log(error.response);
        throw error;
    } else {
        console.log("Get Payment Response");
        console.log(JSON.stringify(payment));
    }
});

});

paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'ATtug5E9HalVChKGt1zD6DLeGOqUdtWWtXTQ12--FeD3GRpWxJxxIPqHG71cRp0Dk2X8nEJqT0vx7tjK',
    'client_secret': 'EKpW7QNFdVSxRsXFpRa2gWczerXzjc3IJOJi2r8o9O2OlWr_uxdlTG4BIpgtcjTq0GW4zpliycQZZVC0'
  });

app.listen(8000,"127.0.0.1",(req,res)=>{
    console.log("server started");
});
