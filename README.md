# etabbar

Flutter的TabBar，如果设置fontSize 后，出现抖动(shake) 的解决方法

方案 ：让fontSize不参加动画。
##### 使用：复制 项目的中的 etab.dart文件到您的项目里面，示例的下面如下：
```
DefaultTabController(
        child: Column(
          children: <Widget>[
            ETabBar(
              isScrollable: true,
              labelColor: Colors.red,
              labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 14),
              tabs: <Widget>[
                for (int i = 0; i < 4; i++) ETab(child: Text("测试 $i")),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  Container(
                    child: Center(
                      child: Text("view$i"),
                    ),
                  ),
              ],
            ))
          ],
        ),
        length: 4,
      ),
```
##### etab.dart 文件是通过 复制tab.dart的源码，然后修改_TabStyle这个类 的build 方法得到的，修改代码如下
```dart
 final double fontSize = selected
        ? (animation.value < 0.5
            ? defaultStyle.fontSize
            : defaultUnselectedStyle.fontSize)
        : (animation.value < 0.5
            ? defaultUnselectedStyle.fontSize
            : defaultStyle.fontSize);
return DefaultTextStyle(
      style: textStyle.copyWith(color: color, fontSize: fontSize),
      child: IconTheme.merge(
        data: IconThemeData(
          size: 24.0,
          color: color,
        ),
        child: child,
      ),
    );
```


