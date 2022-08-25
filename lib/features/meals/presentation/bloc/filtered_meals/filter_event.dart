part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  final String categorieFilter;
  const FilterEvent(this.categorieFilter);
}

class GetFilterEvent extends FilterEvent {
  const GetFilterEvent(super.categorieFilter);

  @override
  List<Object?> get props => [categorieFilter];
}
