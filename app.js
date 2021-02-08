const express=require("express");
const loginRouter=require("./router/login.js");
let bodyParser=require("body-parser");
let app=express();
let port=5050;
app.listen(port);

app.use( express.static("./public") );

app.use( bodyParser.urlencoded({
	extended:false
}) );

app.use("/v1/user",loginRouter);