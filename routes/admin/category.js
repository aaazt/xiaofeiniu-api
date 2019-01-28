/*菜品类别相关的路由---需要4个 */
//创建路由器
const express = require('express');
const pool = require('../../pool');
var router = express.Router();
module.exports = router;//导出

/*API:GET/admin/category
*含义：客户端获取所有的菜品类别，按编号升序排列
*返回值形如：
*[{cid:1,cname:....},{....}]
*/
router.get('/',(req,res)=>{
  pool.query('SELECT * FROM xfn_category ORDER BY cid',(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})


/*API:DELETE/admin/category/:cid
*含义：根据表示菜品编号的路由参数，删除该商品
*返回值形如：
*[{code:200,msg:'1 categroy deleted'},
code:400,msg:'0 categroy deleted'
*/
router.delete('/:cid',(req,res)=>{
  
  pool.query('DELETE FROM xfn_categroy WHERE cid=?',req.params.cid,(err,result)=>{
    if(err) throw err;
    //获取delete语句在数据库中影响行数
    if(result.affectedRows>0){
      res.send({code:200,msg:'1 categroy deleted'})
    }else{
      res.send({code:400,msg:'0 categroy deleted'})
    }
    
  })
})


/*API:POST/admin/category    |添加
*请求主体参数:{cname:'xxx'}  要求使用JSON格式，不使用键值对格式
*含义：客户端获取所有的菜品类别，按编号升序排列
*返回值形如：
*[{code:200,msg:'1 categroy deleted'，cid:x}]
*/


/*API:PUT/admin/category    |更新
*请求参数：{cid:xx,cname:'xxxx'}
*含义：根据菜品类别编号修改类别
*返回值形如：
*{code:200,msg:'1 categroy modified'}
*{code:400,msg:'0 categroy modified',not exists}
*{code:401,msg:'1 categroy modified',no modification}
*

]
*/

