import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  MyAppBar ({this.title});
  final Widget title;
  @override
  Widget build(BuildContext contenxt){
    return new Container(
      height: 96.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration:  new BoxDecoration(color: Colors.blue),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon:  new Icon(Icons.menu), onPressed: () {},
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search), onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('实例标题', style: Theme.of(context).primaryTextTheme.title),
          ),
          new Expanded(
            child: new Center(
              child: new Text('你好，世界！'),
            ),
          ),
        ],
      )
    );
  }

}
// 有质感的页面处理
class TutorialHome extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: '导航菜单',
          onPressed: null,
        ),
        title: new Text("实例标题"),
        actions: <Widget>[
          new IconButton(
            icon:  new Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Text('云龙，你好！'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: '增加',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
  }

 // 手势处理
 class MyButton extends StatelessWidget{
   @override
   Widget build (BuildContext context){
     return new GestureDetector(
       onTap: (){
         print('MyButton被监听了！');
       },
       child: new Container(
         height: 6.0,
         padding: const EdgeInsets.all(0.0),
         margin: const EdgeInsets.symmetric(horizontal: 0.0),
         decoration:new BoxDecoration(
           borderRadius: new BorderRadius.circular(1.0),
           color: Colors.lightGreen,
         ) ,
         child: new Center(
           child:  new Text('点击任意屏幕'),
         ),
       ),
     );
   }
 }
// 手势处理嵌套
 class MyButtonInsert extends StatelessWidget{
   @override
   Widget build (BuildContext context){

return new Scaffold(
  appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: '导航菜单',
          onPressed: null,
        ),
        title: new Text("实例标题"),
        actions: <Widget>[
          new IconButton(
            icon:  new Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child:  new GestureDetector(
        onTap: (){
         print('MyButton被监听了！');
       },
       child: new Container(
         height: 6.0,
         padding: const EdgeInsets.all(0.0),
         margin: const EdgeInsets.symmetric(horizontal: 0.0),
         decoration:new BoxDecoration(
           borderRadius: new BorderRadius.circular(1.0),
           color: Colors.lightGreen,
         ) ,
         child: new Center(
           child:  new Text('点击任意屏幕'),
         ),
       ),
        ),
      ),
);
   }
 }
void main() {
 runApp(new MaterialApp(
   title: 'Flutter教程',
  // home: new MyScaffold(),
  // home:  new TutorialHome(),
  // home:  new MyButton(),
  home:  new MyButtonInsert(),
 ));
}

