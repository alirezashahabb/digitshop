import 'package:apple_shop/model/varaint_type_model.dart';
import 'package:apple_shop/model/varaints_model.dart';

class ProductVaraintModel {
  final VaraintTypeModel varaintTypeModel;
  final List<VaraintsModel> varaints;

  ProductVaraintModel({required this.varaintTypeModel, required this.varaints});
}
