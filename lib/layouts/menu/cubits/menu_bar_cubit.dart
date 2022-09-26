import 'package:bloc/bloc.dart';

class MenuBarCubit extends Cubit<int> {

  MenuBarCubit() : super(0);

  changePage(int page) => emit(page);
}
