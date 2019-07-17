import 'package:flutter_app/common/model/user.dart';
import 'package:redux/redux.dart';


// 绑定
final UserReducer = combineReducers<User>([
    TypedReducer<User,RefreshUserAction>(_refresh)
]);


// 处理方法
User _refresh(User user,action){
  user = action.user;
  return user;
}


/// 定义action
class RefreshUserAction {
  final User user;

  RefreshUserAction(this.user);
}
