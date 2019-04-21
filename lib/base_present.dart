abstract class BaseContract {
  void screenUpdate();
}


class BasePresenter {
  BaseContract _view;
  BasePresenter(this._view);

  updateScreen() {
    _view.screenUpdate();

  }
}