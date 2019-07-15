import 'package:flutter/material.dart';

class FixdqPullLoadWidget extends StatefulWidget {
  ///item渲染
  final IndexedWidgetBuilder itemBuilder;

  /// 加载更多
  final RefreshCallback onLoadMore;

  /// 下拉刷新
  final RefreshCallback onRefresh;

  /// 配置信息
  final PullLoadWidgetConfig config;

  final Key refreshKey;
  final ScrollController scrollController;
  const FixdqPullLoadWidget(
      {Key key,
      this.itemBuilder,
      this.onLoadMore,
      this.onRefresh,
      this.config,
      this.refreshKey, this.scrollController})
      : super(key: key);

  @override
  _FixdqPullLoadWidgetState createState() => _FixdqPullLoadWidgetState();
}

class _FixdqPullLoadWidgetState extends State<FixdqPullLoadWidget> {

  @override
  void initState() {
    /// TODO: implement initState
    widget.scrollController.addListener(() {
      /// 判断是否到底部
      if (widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent) {
        /// 加载更多
        if (this.widget.config.needLoadMore.value) {
          /// 可以加载更多 执行调用
          this.widget.onLoadMore?.call();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
      key: widget.refreshKey,

      ///下拉刷新触发，返回的是一个Future
      onRefresh: widget.onRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          /// 返回Item
          return _getItem(index);
        },

        /// 滑动监听
        controller: widget.scrollController,

        /// 任何情况 都可以滑动
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _getListCount(),
      ),
    );
  }

  /// 根据配置状态返回实际列表数量
  /// 实际上这里可以根据你的需要做更多的处理
  /// 比如多个头部，是否需要空页面，是否需要显示加载更多。
  _getListCount() {
    if (widget.config.needHeader) {
      /// 如果需要头部，用Item 0 的 Widget 作为ListView的头部
      /// 列表数量大于0时，因为头部和底部加载更多选项，需要对列表数据总数+2
      return (widget.config.dataList.length > 0)
          ? widget.config.dataList.length + 2
          : widget.config.dataList.length + 1;
    } else {
      /// 如果不需要头部，在没有数据时，固定返回数量1用于空页面呈现
      if (widget.config.dataList.length == 0) {
        return 1;
      }

      ///如果有数据,因为部加载更多选项，需要对列表数据总数+1
      return (widget.config.dataList.length > 0)
          ? widget.config.dataList.length + 1
          : widget.config.dataList.length;
    }
  }

  /// 根据配置状态返回实际列表渲染Item
  _getItem(int index) {
    if (!widget.config.needHeader &&
        index == widget.config.dataList.length &&
        widget.config.dataList.length != 0) {
      /// 如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (widget.config.needHeader &&
        index == widget.config.dataList.length - 1 &&
        widget.config.dataList.length != 0) {
      /// 如果需要头部，并且数据不为0，当index等于数据长度 -1 时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (!widget.config.needHeader && widget.config.dataList.length == 0) {
      ///如果不需要头部，并且数据为0，渲染空页面
      return _buildEmpty();
    } else {
      ///回调外部正常渲染Item，如果这里有需要，可以直接返回相对位置的index
      return widget.itemBuilder(context, index);
    }
  }

  /// 上拉加载更多
  _buildProgressIndicator() {
    Widget bottomWidget =
        (widget.config.needLoadMore.value) ? Text('加载更多') : Container();
    return Padding(
      child: Center(
        child: bottomWidget,
      ),
      padding: EdgeInsets.all(10.0),
    );
  }

  /// 空页面
  _buildEmpty() {
    return Center(
      child: Text('没有数据'),
    );
  }
}

class PullLoadWidgetConfig  extends ChangeNotifier {
  ///数据，对齐增减，不能替换
  List _dataList = new List();

  get dataList => _dataList;

  set dataList(List value) {
    _dataList.clear();
    if (value != null) {
      _dataList.addAll(value);
      notifyListeners();
    }
  }

  addList(List value) {
    if (value != null) {
      _dataList.addAll(value);
      notifyListeners();
    }
  }

  ///是否需要加载更多
  bool _needLoadMore = true;

  set needLoadMore(value) {
    _needLoadMore = value;
    notifyListeners();
  }

  get needLoadMore => _needLoadMore;

  ///是否需要头部
  bool _needHeader = true;

  set needHeader(value) {
    _needHeader = value;
    notifyListeners();
  }

  get needHeader => _needHeader;

  ///是否加载中
  bool isLoading = false;
}
