/*
* 菜品相关路由 
*/
const express = require('express');
const pool = require('../../pool');
var router = express.Router();
module.exports = router;


/*
*API：  GET  /admin/dish  
*获取所有的菜品（按类别进行分类）
*返回数据：
* [
*   {cid: 1, cname:'肉类', dishList:[{},{},...]}
*   {cid: 2, cname:'菜类', dishList:[{},{},...]}
*   ....
* ]
*/
router.get('/',(req,res)=>{
  //为了获取所有菜品必须先查询菜品
  pool.query("SELECT cid,cname FROM xfn_category ORDER BY cid",(err,result)=>{
    if(err)throw err;
    res.send(result);
    var categoryList = result
    for(var c of categoryList){}
  })
})