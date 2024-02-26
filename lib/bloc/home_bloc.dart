import 'package:bloc/bloc.dart';

import '../core/api_status.dart';
import '../providers/apiProviders.dart';
import 'api_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(apiState: APILoading())) {
    on<LoadProductEvent>((event, emit) async {
      var data = await ApiProvider().LoadProduct();
      if (data is FailedStatus) {
        (emit(state.copWith(ApiError(error: data.errore))));
      } else if (data is SuccessStatus) {
        emit(state.copWith(ApiCompleted(data: data.data)));


      }
    else{emit(state.copWith(APILoading()));}
    });

  }
}
