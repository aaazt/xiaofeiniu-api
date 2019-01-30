


const express = require('express');
const pool = require('../../pool.js');
var router=express.Router();
module.exports=router;

/**
 * 获取所有桌台信息
 * GET /admin/table
 * 返回数据：[{tid:xxx tname:'xxx',tatus:''}]
 */
router.get('/',(req,res)=>{
  pool.query('SELECT * FROM xfn_table ORDER BY tid',(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})


 /**
 * 获取桌台详情
 * 预约状态的详情---预约表
 * GET /admin/table/reservtion/:tid
 * 占用状态的详情---订单表
 * GET /admin/table/inuse/:tid
 */

 /**
  * 修改桌台的状态
  * PATCH /admin/table
  */

  /**
   * 添加桌台
   * POST admin/table
   */

   /**
   * 删除桌台
   * DELETE admin/table:did
   */