extension IterableExtension<E> on Iterable<E> {
  Iterable<E> joinWith(E separator) => JoinedIterable(this, separator);
}

class JoinedIterable<E> extends Iterable<E> {
  JoinedIterable(this._iterable, this._separator);

  final Iterable<E> _iterable;
  final E _separator;

  @override
  Iterator<E> get iterator => _JoinedIterator(_iterable.iterator, _separator);
}

class _JoinedIterator<E> implements Iterator<E> {
  _JoinedIterator(this._iterable, this._separator);

  final Iterator<E> _iterable;
  final E _separator;

  bool _isFirst = true;
  bool _hasNext = false;
  bool _useSeparator = false;

  @override
  E get current => _useSeparator ? _separator : _iterable.current;

  @override
  bool moveNext() {
    if (_isFirst) {
      _isFirst = false;
      return _iterable.moveNext();
    }

    if (_useSeparator) {
      _useSeparator = false;
      return true;
    }

    final hasNext = _iterable.moveNext();
    if (hasNext) {
      _useSeparator = true;
      _hasNext = true;
      return true;
    }

    return _hasNext;
  }
}
