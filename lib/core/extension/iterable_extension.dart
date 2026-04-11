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
  bool _useSeparator = false;

  @override
  E get current => _useSeparator ? _separator : _iterable.current;

  @override
  bool moveNext() {
    // 1. 如果是第一个元素，直接取底层迭代器的第一个元素
    if (_isFirst) {
      _isFirst = false;
      return _iterable.moveNext();
    }

    // 2. 如果上一次是分隔符，那么这一次应该取底层迭代器真正的值
    // （底层迭代器已经在上一步提前 moveNext 过了）
    if (_useSeparator) {
      _useSeparator = false;
      return true;
    }

    // 3. 尝试步进底层迭代器
    final hasNext = _iterable.moveNext();

    // 如果底层还有下一个元素，说明我们在输出它之前需要先输出一个分隔符
    if (hasNext) {
      _useSeparator = true;
      return true;
    }

    // 4. 底层没有任何元素了，直接结束
    return false;
  }
}
