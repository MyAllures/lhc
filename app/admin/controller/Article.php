<?php
namespace app\admin\controller;

/**
*	文章管理
*/
class Article extends Admin{
	
	protected $Article = null;
    protected $ArticleClass = null;
    protected function _initialize(){
        parent::_initialize();
        $this->Article = model('Article');
        $this->ArticleClass = model('ArticleClass');
        $this->ArticleRead = model('ArticleRead');
    }

    public function index(){
        $this->assign('meta_title','文章列表');
        return $this->fetch();
    }

    public function load(){
        $page = input('get.page');
        $limit = input('get.limit');
        $where = [];
        $object = input('get.object','');
        if ($object != '') {
            $where['object'] = $object;
        }
        $list = $this->Article->where($where)->order('id desc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['class_cname'] = $value['class0']['cname'];
            $data[$key]['cname'] = $value['cname'];
            $data[$key]['click'] = $value['click'];
            $data[$key]['state'] = $value['state'];
            $data[$key]['object_text'] = $value['object_text'];
            $data[$key]['update_time'] = $value['update_time'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }

    public function add(){
        if ($this->request->isPost()) {
            $this->Article->class_1 = input('post.class_1');
            $this->Article->class_2 = input('post.class_2');
            $this->Article->class_3 = input('post.class_3');
            $this->Article->cname = input('post.cname');
            $this->Article->keywords = input('post.keywords');
            $this->Article->description = input('post.description');
            $this->Article->content = input('post.content');
            $this->Article->object = input('post.object');
            $this->Article->state = input('post.state');
            $result = $this->Article->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'添加文章成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'添加文章失败']);
        }else{
            $this->assign('meta_title','添加文章');
            return $this->fetch();
        }
    }

    public function edit(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $article = $this->Article->where(['id'=>$id])->find();
            if (!$article) {
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }
            $article->class_1 = input('post.class_1');
            $article->class_2 = input('post.class_2');
            $article->class_3 = input('post.class_3');
            $article->cname = input('post.cname');
            $article->keywords = input('post.keywords');
            $article->description = input('post.description');
            $article->content = input('post.content');
            $article->object = input('post.object');
            $article->state = input('post.state');
            $result = $article->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'编辑文章成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'编辑文章失败']);
        }else{
            $id = input('get.id');
            $article = $this->Article->where(['id'=>$id])->find();
            if (!$article) {
                $this->error('参数错误');
            }
            $this->assign('article',$article);
            $this->assign('meta_title','添加文章');
            return $this->fetch();
        } 
    }

    public function delete(){
        $ids = input('post.ids/a');
        $result =  $this->Article->where(['id'=>['in',$ids]])->delete();
        if ($result) {
            return json(['data'=>null,'code'=>0,'msg'=>'删除成功']);
        }
        return json(['data'=>null,'code'=>1,'msg'=>'删除失败']);
    }

    public function changestate(){
        $ids = input('post.ids/a');
        $state = input('post.state');
        $result = $this->Article->where(['id'=>['in',$ids]])->update(['state' => $state]);
        if ($result) {
            return json(['data'=>null,'code'=>0,'msg'=>'改变状态成功']);
        }
        return json(['data'=>null,'code'=>1,'msg'=>'改变状态失败']);
    }

    public function loadclassforselect(){
        $pid = input('post.pid');
        $list = $this->ArticleClass->where(['pid'=>$pid])->order('sort asc,id desc')->select();
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['cname'] = $value['cname'];
        }
        return json(['data'=>$data,'code'=>0,'msg'=>'加载分类成功']);
    }

    public function classify(){
        $pid = input('get.pid');
        $pclass = $this->ArticleClass->where(['id'=>$pid])->find();
        $this->assign('pclass',$pclass);
        $this->assign('meta_title','文章分类');
        return $this->fetch();
    }

    public function loadclass(){
        $page = input('get.page');
        $limit = input('get.limit');
        $where['pid'] = input('get.pid',0);
        $list = $this->ArticleClass->where($where)->order('sort asc')->paginate($limit,false,['page'=>$page]);
        $data = [];
        foreach ($list as $key => $value) {
            $data[$key]['id'] = $value['id'];
            $data[$key]['cname'] = $value['cname'];
            $data[$key]['sort'] = $value['sort'];
            $data[$key]['state'] = $value['state'];
            $data[$key]['subclasses'] = $value['subclasses'];
        }
        return json(['data'=>$data,'count'=>$list->total(), 'code'=>0,'msg'=>'加载成功']);
    }

    public function addclass(){
        if ($this->request->isPost()) {
            $this->ArticleClass->pid = input('post.pid');
            $this->ArticleClass->cname = input('post.cname');
            $result = $this->ArticleClass->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'添加成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'添加失败']);
        }else{
            $pid = input('get.pid');
            $pclass = $this->ArticleClass->where(['id'=>$pid])->find();
            $this->assign('pclass',$pclass);
            $this->assign('meta_title','添加分类');
            return $this->fetch();
        }
    }

    public function editclass(){
        if ($this->request->isPost()) {
            $id = input('post.id');
            $class = $this->ArticleClass->where(['id'=>$id])->find();
            if (!$class) {
                return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
            }
            $class->cname = input('post.cname');
            $result = $class->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'编辑成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'编辑失败']);
        }else{
            $id = input('get.id');
            $class = $this->ArticleClass->where(['id'=>$id])->find();
            $this->assign('class',$class);
            $this->assign('meta_title','编辑分类');
            return $this->fetch();
        }
    }

    public function sortclass(){
        $id = input('post.id');
        $class = $this->ArticleClass->get($id);
        if ($class) {
            $sort = input('post.sort');
            $class->sort = $sort;
            $result = $class->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'排序成功']);
            }
        }   
        return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
    }

    public function changeclassstate(){
        $id = input('post.id');
        $class = $this->ArticleClass->where(['id'=>$id])->find();
        if ($class) {
            $state = input('post.state');
            $class->state = $state == 'true'?1:0;
            $result = $class->save();
            if ($result) {
                return json(['data'=>null,'code'=>0,'msg'=>'改变状态成功']);
            }
            return json(['data'=>null,'code'=>1,'msg'=>'改变状态失败']);
        }else{
            return json(['data'=>null,'code'=>1,'msg'=>'参数错误']);
        }
    }


    //文章详情
    public function detail(){
    	$id = input('post.id');
    	$artcle = $this->Article->where(['id'=>$id])->find();
    	if ($artcle) {
    		//判断是否阅读
    		$this->read($id);

    		$data['id'] = $artcle['id'];
    		$data['cname'] = $artcle['cname'];
    		$data['content'] = $artcle['content'];
    		return json(['data'=>$data,'code'=>0,'msg'=>'获取成功']);
    	}else{
    		return json(['data'=>$id,'code'=>1,'msg'=>'参数错误']);
    	}
    }

	private function read($article_id){
		$user_id = $this->user['id'];

		$record = $this->ArticleRead->where(['article_id'=>$article_id,'user_id'=>$user_id])->find();
		if (!$record) {
			$this->ArticleRead->article_id = $article_id;
			$this->ArticleRead->user_id = $user_id;
			$this->ArticleRead->count = 1;
			$this->ArticleRead->save();
		}else{
			$record->count = ['exp','count + 1'];
			$record->save();
		}
	}
}