abstract class MainStates {}

abstract class MainActions extends MainStates {}

class Success extends MainStates {}

class Error extends MainStates {}

class Loading extends MainStates {}

class Idle extends MainStates {}

class NavigateToNextPage extends MainActions {}