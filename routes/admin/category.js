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
  //删除菜品类别前必须先把属于该类别的菜品的类别编号改为NULL外键约束问题--先update,再delete
  pool.query('UPDATE xfn_dish SET categoryId=NULL WHERE categoryId=?',req.params.cid,(err,result)=>{
    //直接写SQL语句是异步请求，不会按先后执行，加上if就可以了

    if(err) throw err;
    //至此指定类别的菜品已经修改完毕

    pool.query('DELETE FROM xfn_category WHERE cid=?',req.params.cid,(err,result)=>{
      if(err) throw err;
      //获取delete语句在数据库中影响行数
      if(result.affectedRows>0){
        res.send({code:200,msg:'1 categroy deleted'})
      }else{
        res.send({code:400,msg:'0 categroy deleted'})
      }
      
    })
  })

 
})


/*API:POST/admin/category    |添加  POST非幂等  PUT是幂等（添加相同的信息，不管执行 添加多少次，结果是一样的）
*请求主体参数:{cname:'xxx'}  要求使用JSON格式，不使用键值对格式
*含义：客户端获取所有的菜品类别，按编号升序排列
*返回值形如：
*[{code:200,msg:'1 categroy deleted'，cid:x}]
*/
router.post('/',(req,res)=>{
  console.log('获取到请求数据');
  //console.log(req.body);
  var data = req.body;//形如{cname:'xxx'}
  pool.query('INSERT INTO xfn_category SET ?',data,(err,result)=>{
    if(err) throw err;
    res.send({code:200,msg:'1 category post'})
  }) //insert 和update可简写set自动根据json来添加
})


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
router.put('/',(req,res)=>{
  var data=req.body;//请求数据{cid:xx,cname:'xx'}
  //此处可以对输入数据进行检验
  pool.query('UPDATE xfn_category SET ? WHERE cid=?',[data,data.cid],(err,result)=>{
    console.log(result);
    if(err) throw err;
    if(result.changedRows>0){
      //实际真的更新了一行
      res.send({code:200,msg:'1 categroy modified'})
    }else if(result.affectedRows==0){
      res.send({code:400,msg:' categroy modified not exist'})
    }else if(result.affectedRows==1&& result.changedRows==0){
      //影响到1行，但修改了0行---新值与旧值一样
      res.send({code:401,msg:'1 categroy modified no modification'})
    }
    //res.send(
      //,
      //{code:400,msg:'0 categroy modified',not exists},
      //
    //)
  })
})

