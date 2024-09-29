var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('./client/index')
});



router.get('/search', function(req, res, next) {
  res.render('./client/fundraiserSearch')
});


router.get('/fundraiser/:id', function(req, res, next) {
  const fundraiserId = req.params.id; // 获取路径中的 ID
  // 这里可以根据 ID 查询数据库，获取该筹款活动的详细信息
  res.render('./client/fundraiser_detail', { id: fundraiserId });
});



//底部公共
router.get('/foot',function(req,res,next){
	res.render('./client/footer')
})
//公共头部
router.get('/head',function(req,res,next){
	res.render('./client/header')
})
//

module.exports = router;
