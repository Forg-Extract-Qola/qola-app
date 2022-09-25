import 'package:hive/hive.dart';
import 'package:qola_app/core/base/reflection.dart';
import 'package:reflectable/mirrors.dart';

abstract class BoxRepository<T> {
  Future<List<T>> getAll({ bool Function(T entity)? predicate });
  Future<T?> getOne(bool Function(T entity) predicate);
  Future<T?> saveOne(T entity);
  Future<List<T>> saveAll(List<T> entities);
  Future<bool> deleteOne(bool Function(T entity) predicate);
  Future<bool> deleteAll2({ bool Function(T entity) predicate });
  Future<bool> deleteAll({ bool Function(dynamic entity) predicate });
  Future<bool> updateOne(T entity, { bool Function(T entity) predicate });
}

class BoxRepositoryImpl<T> implements BoxRepository<T> {
  @override
  Future<List<T>> getAll({bool Function(T entity)? predicate}) async {
    var box = await _getBox();
    if (predicate != null) return box.values.where(predicate).toList();
    return box.values.toList();
  }

  @override
  Future<T?> getOne(bool Function(T entity) predicate) async {
    var box = await _getBox();
    final results = box.values.where(predicate).toList();
    return results.isNotEmpty ? results.first : null;
    //return box.values.firstWhere(predicate);
  }

  @override
  Future<T?> saveOne(T entity) async {
    var box = await _getBox();
    await box.add(entity);
    return entity;
  }

  @override
  Future<List<T>> saveAll(List<T> entities) async{
    var box = await _getBox();
    await box.addAll(entities);
    return entities;
  }

  @override
  Future<bool> deleteOne(bool Function(T entity) predicate) async {
    var box = await _getBox();
    final allValues = box.values.toList();
    final index = allValues.indexWhere(predicate);
    await box.deleteAt(index);
    return true;
  }

  @override
  Future<bool> deleteAll2({bool Function(T entity)? predicate}) async {
    var box = await _getBox();
    List<dynamic> keys = box.keys.map((e) => e.index).toList();
    for(int i = 0; i < keys.length; i++) {
      await box.delete(keys[i]);
    }
    return true;
  }

  Future<bool> deleteByKey(dynamic key) async {
    var box = await _getBox();
    await box.delete(key);
    return true;
  }

  @override
  Future<bool> deleteAll({bool Function(dynamic entity)? predicate}) async {
    var box = await _getBox();
    final keys = (predicate != null ? box.keys.where(predicate).toList() : box.keys.toList());
    for(int i = 0; i < keys.length; i++) {
      await box.delete(keys[i]);
    }
    return true;
  }

  Future<Box<T>> _getBox() async {
    TypeMirror classMirror = reflector.reflectType(T);
    final boxName = classMirror.simpleName.toLowerCase().replaceAll('entity', '');
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  @override
  Future<bool> updateOne(T entity, {bool Function(T entity)? predicate}) async{
    var box = await _getBox();
    final allValues = box.values.toList();
    final index = allValues.indexWhere(predicate!);
    final keyByIndex = box.keyAt(index);
    await box.put(keyByIndex, entity);
    return true;
  }
}