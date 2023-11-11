// 模仿 kotlin 实现 let、also、apply、run、with、takeIf、takeUnless
import 'dart:convert';

extension ObjectExtensions<T> on T {
  R fnmap<R>(R mapper(T val)) {
    return mapper(this);
  }

  Future<T> asFuture() {
    return Future.value(this);
  }

  T addTo(List<T> iter) {
    iter.add(this);
    return this;
  }

  R let<R>(R Function(T it) block) => block(this);

  T apply(void Function(T it) block) {
    block(this);
    return this;
  }

  R run<R>(R Function(T it) block) => block(this);

  T? takeIf(bool Function(T it) predicate) {
    if (predicate(this)) {
      return this;
    }
    return null;
  }

  T? takeUnless(bool Function(T it) predicate) {
    if (!predicate(this)) {
      return this;
    }
    return null;
  }

  String toJsonStr() {
    return json.encode(this);
  }
}

void main() {
  'Hello'.let((it) => print(it.length));
  'Hello'.apply((it) => print(it.length));

  'Hello'.run((it) => print(it.length));

  'Hello'.takeIf((it) => it.length > 5);

  'Hello'.takeUnless((it) => it.length > 5);
}
