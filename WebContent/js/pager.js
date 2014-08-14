 /*var total=20,perShow=10; 

  var num = total<10?total:10; //最多显示个数
  var step = 2; //步长
  var frowardNum = 9,backNum=0;//触发移动的数字

  var startNum=1;
  var endNum=startNum+num-1;
  var curpage=1;*/
var config = {};
$(function(){

	//new Pager('',20,2,10).init();

});


  var getData = function(page,params,url){
    $.ajax({
          dataType: "json",
          type:'post',
          url: url,
          data: {'type':type,'page':page},
          success:function(data){
          console.log(data);
          $('#houseInfolist7').empty();
          $('#houseInfolist7').append(tmpl("tmpl-demo", data.result));
          var inco=type=='obuilding'?'images/office_24.png':type=='villa'?'images/villa_24.png':'images/apartment_24.png';
          //$('#icon-h').attr('src',inco);
          }
        });
  };


function Pager (id,total,step,perShow,type){
  this.type = type;
  this.total = total; //总数
  this.step = step||2;  //每次移动多少位
  this.perShow = perShow||10; //每页显示多少个
  this.maxShow =total<perShow?total:perShow; //最多显示个数
  this.startNum=1;  // 开始页码
  this.frowardNum = 9;this.backNum=0;//触发移动的数字
    this.endNum=this.startNum+this.perShow-1; //结束页码
    this.curpage=1;  //当前页码
    var self = this;
    //初始化组件
    this.init =  function(){
      $("#test3 ul").append($("<li>").attr("id","pager_id_pre").append($("<a>").text("«")));
      for(var i=this.startNum-1;i<this.endNum;i++){
        $("#test3 ul").append($("<li>").attr("id","pager_id_"+i).append($("<a>").attr("href","javascript:void(0);")));
      }
      $("#test3 ul").append($("<li>").attr("id","pager_id_next").append($("<a>").text("»")));
      self.showPageNum(self.startNum,self.endNum,1);


   //绑定点击事件
   $("#test3").on('click','a',function(){
       var o = $(this),_curpage,beforeChange;
         $("#test3 ul li").each(function(i){
          if($(this).hasClass('active')){
            beforeChange = $(this).find('a').text()*1;
          }
              
        });
        console.log(beforeChange);
        if(o.text()==='»'){
          _curpage=beforeChange+1>self.total?self.total:beforeChange+1;
        }

        if(o.text()==='«'){
          _curpage=beforeChange-1<1?1:beforeChange-1;
        }
       
       
     if(this.frowardNum!=null)
          endNum=startNum+num-1;
      if(!isNaN(o.text()))
         _curpage=o.text()*1; 
      console.log('startNum= '+self.startNum,'frowardNum = '+self.frowardNum,
    		  'backNum='+self.backNum,'endNum = '+self.endNum,'_curpage = '+_curpage);
      self.curpage = _curpage;
      if(_curpage===self.frowardNum){
         console.log('-----forward----');
         self.endNum+=step;
         if(self.endNum>self.total){
            self.endNum = self.total;
            self.startNum += self.total - self.frowardNum-1;
            self.frowardNum = null;
         }else{
            self.startNum+= self.step;
            self.frowardNum +=self.step;
         }
        
         self.backNum =self.startNum+1;
      }

       if(_curpage===self.backNum){
         console.log('-----back----');
        self.startNum-= step;
        if(self.startNum<=0){
          self.startNum = 1;
          self.endNum -= (self.backNum-1) - self.startNum;
          self.backNum = null;
        }else{
         self.backNum -=self.step;
          self.endNum-=self.step;
        }
        
        self.frowardNum = self.endNum-1;
      };
     self.showPageNum(self.startNum,self.endNum,self.curpage);
     $("#test3 ul a").each(function(i){
       
          if($(this).text()==_curpage)
            $(this).parent().addClass('active');
      });
     
     
     $.ajax({
         dataType: "json",
         type:'post',
         url: "getHibt",
         data: {'type':$('#left_nav_menu li').filter('.active').attr('id'),'page':_curpage},
         success:function(data){
         console.log(data);
         $('#houseInfolist7').empty();
         $('#houseInfolist7').append(tmpl("tmpl-demo", data.result));
         var inco=type=='obuilding'?'images/office_24.png':type=='villa'?'images/villa_24.png':'images/apartment_24.png';
         //$('#icon-h').attr('src',inco);
         }
       });

    });
   	
    };

    //页码显示
    this.showPageNum = function(s,e,curpage){

      $("#test3 ul li").removeClass('active');
      $("#test3 ul a").each(function(i){
        if(!(i==0 || i==11))
          $(this).text(s++);

        if($(this).text()==curpage)
            $(this).parent().addClass('active');
      });
    };
    
    //获取数据
    this.getData = function(){

    }
  



};