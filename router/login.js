var express=require("express");
var pool=require("./pool.js");
var r=express.Router();
/*-------注册路由---------*/
r.get("/sinup/:uname&:upwd&:email&:phone",(req,res)=>{
	var obj=req.params;
	var _uname=obj.uname;
	var sel_sql="select * from dazzle_user where uname=?"
	var ins_sql="insert into dazzle_user set ?"
	pool.query(sel_sql,[_uname],(err,result)=>{
		if(err) throw err;
		if(result.length==0){
			pool.query(ins_sql,[obj],(err,result)=>{
				if(err) throw err;
				res.set('Access-Control-Allow-Origin', "*");
				res.send("注册成功");
			});
		}else{
			res.send("用户名已被注册");
		}		
	});

});


/*-------登录路由---------*/
r.post("/login/:uname&:upwd",(req,res)=>{
	var _uname=req.body.uname;
	var _upwd=req.body.upwd;
	var sql="select * from dazzle_user where uname=? and upwd=?";
	pool.query(sql,[_uname,_upwd],(err,result)=>{
		if(err) throw err;
		res.set('Access-Control-Allow-Origin', "*");
		if(result==0){
			res.send("用户名或密码错误");
		}else{
			res.send("登陆成功");
		}
	});
});

module.exports=r;
