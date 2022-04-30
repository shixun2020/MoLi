module.exports = app => {
const { router, controller } = app;
router.get('/',controller.houtai.houtai);
router.get('/uindex',controller.user.uindex);//用户相关路由
router.get('/fail',controller.user.fail);
router.post('/fail',controller.user.fail);
router.get('/login',controller.user.login);
router.post('/login',controller.user.dologin);
router.get('/register',controller.user.register);
router.post('/register',controller.user.doregister);
router.get('/getu',controller.user.getu);
router.get('/getus',controller.user.getus);
router.post('/getus',controller.user.getus);
router.get('/getucount',controller.user.getucount);
router.post('/getucount',controller.user.getucount);
router.get('/createu',controller.user.createu);
router.post('/createu',controller.user.createu);
router.get('/updateu/:id',controller.user.updateu);
router.post('/updateu/:id',controller.user.updateu);
router.get('/deleteu',controller.user.deleteu);
router.post('/deleteu',controller.user.deleteu);

router.get('/captcha', controller.captcha.index);//验证码相关路由

router.get('/column',controller.content.column);//内容相关路由
router.get('/lanmu',controller.content.lanmu);
router.get('/content/:id', controller.content.getcontent);
router.get('/getcontents', controller.content.getcontents);
router.get('/edit/:id', controller.content.edit);
router.post('/edit/:id', controller.content.edit);
router.get('/delete', controller.content.delete);
router.get('/add', controller.content.add);
router.post('/add', controller.content.add);

router.get('/lm', controller.lanmu.lm);//栏目相关路由
router.get('/getlm', controller.lanmu.getlm);
router.get('/success', controller.lanmu.success);
router.get('/firstpage', controller.lanmu.firstpage);
router.get('/getlm/:id', controller.lanmu.getlm);
router.get('/getlms', controller.lanmu.getlms);
router.post('/getlms', controller.lanmu.getlms);
router.get('/getlmcount',controller.lanmu.getlmcount);
router.post('/getlmcount',controller.lanmu.getlmcount);
router.get('/updatelm/:id', controller.lanmu.updatelm);//能够读取到数据库信息带着相应数据跑，
router.post('/updatelm/:id', controller.lanmu.updatelm);
router.get('/updatel', controller.lanmu.updatelm);
router.post('/updatel', controller.lanmu.updatelm);
router.get('/deletelm', controller.lanmu.deletelm);
router.post('/deletelm', controller.lanmu.deletelm);
router.get('/createlm', controller.lanmu.createlm);
router.post('/createlm', controller.lanmu.createlm);

router.get('/ti', controller.articles.tiny);//文章相关路由
router.get('/getcreate', controller.articles.getcreate);
router.post('/getcreate', controller.articles.getcreate);
router.get('/getarticle/:id', controller.articles.getarticle);
router.get('/getarticles', controller.articles.getarticles);
router.post('/getarticles', controller.articles.getarticles);
router.get('/getacount', controller.articles.getacount);
router.post('/getacount', controller.articles.getacount);
router.get('/getupdate/:id', controller.articles.getupdate);
router.post('/getupdate/:id', controller.articles.getupdate);
router.get('/getdelete', controller.articles.getdelete);
router.post('/getdelete', controller.articles.getdelete);

router.get('/upload', controller.files.fi);//文件上传相关路由
// router.post('/upload', controller.files.upload);
router.post('/upload', controller.files.upload);
router.get('/sc', controller.files.sc);//上传图片文章到数据库
router.post('/sc', controller.files.sc);
router.get('/getimg/:id', controller.files.getimg);
router.get('/getimgs', controller.files.getimgs);
router.post('/getimgs', controller.files.getimgs);
router.get('/deletefile', controller.files.delete);
router.post('/deletefile', controller.files.delete);
router.get('/updatefile/:id', controller.files.updateimg);
router.post('/updatefile/:id', controller.files.updateimg);

router.get('/up', controller.up.testform);//测试Ajax上传文件
router.post('/up', controller.up.testup);//测试Ajax上传文件
router.get('/gfile', controller.up.gfile);
router.post('/gfile', controller.up.uploadfile);
router.get('/gimg/:id', controller.up.getimg);
router.get('/gimgs', controller.up.getimgs);
router.get('/deletef', controller.up.delete);
router.post('/deletef', controller.up.delete);
router.get('/updatef/:id', controller.up.updateimg);
router.post('/updatef/:id', controller.up.updateimg);

router.get('/page',controller.page.page);//文件分页相关路由
router.get('/getpage',controller.page.getpage);
router.post('/getpage',controller.page.getpage);
router.get('/gpage/:id',controller.page.gpage);
router.post('/gpage/id',controller.page.gpage);
router.get('/getpages',controller.page.getpages);
router.post('/getpage',controller.page.getpage);
router.get('/getcount',controller.page.getcount);
router.post('/getcount',controller.page.getcount);
router.get('/deletep',controller.page.deletep);
router.post('/deletep',controller.page.deletep);
router.get('/updateimgs/:id',controller.page.updateimgs);
router.post('/updateimgs/:id',controller.page.updateimgs);

router.get('/home',controller.houtai.houtai);//后台管理系统相关路由
router.post('/home',controller.houtai.houtai);
router.get('/hlogin',controller.houtai.hlogin);
router.post('/hlogin',controller.houtai.dologin);
router.get('/hregister',controller.houtai.hregister);
router.post('/hregister',controller.houtai.doregister);
router.get('/hfailregister',controller.houtai.failregister);
router.get('/hfaillogin',controller.houtai.faillogin);
router.get('/icom',controller.houtai.icom);
router.get('/icos',controller.houtai.icos);
router.get('/sbar',controller.houtai.sbar);
router.post('/sbar',controller.houtai.sbar);
router.get('/deleteSession',controller.houtai.deleteSession);
router.post('/deleteSession',controller.houtai.deleteSession);
router.get('/uploadsuccess',controller.houtai.uploadsuccess);
router.post('/uploadsuccess',controller.houtai.uploadsuccess);
router.get('/feedbackcount',controller.houtai.feedbackcount);
router.get('/seefrontfile/:id',controller.houtai.seefrontfile);
router.post('/seefrontfile/:id',controller.houtai.seefrontfile);
router.get('/resetpw/:id',controller.houtai.resetpw1);
router.post('/resetpw/:id',controller.houtai.resetpw);

router.get('/feedback',controller.frontpage.feedback);//前台相关路由
router.post('/feedback',controller.frontpage.feedback);
router.get('/fbsuccess',controller.frontpage.fbsuccess);
router.get('/homepage',controller.frontpage.homepage);
router.get('/guide',controller.frontpage.guide);
router.get('/conimgdetail/:id',controller.frontpage.conimgdetail);
router.get('/conarticledetail/:id',controller.frontpage.conarticledetail);
router.get('/failregister',controller.frontpage.failregister);

};