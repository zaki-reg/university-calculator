import 'package:flutter/material.dart';

// Module class to hold module data and its associated controllers
class Module {
  final String name;
  final double coef;
  final double examRatio;
  final double tdTpRatio;
  final bool isTdTp;
  double modAvg = 0.0;

  final TextEditingController tdController = TextEditingController();
  final TextEditingController tpController = TextEditingController();
  final TextEditingController examController = TextEditingController();
  final TextEditingController coefficientController = TextEditingController();

  Module(
    this.name,
    this.coef,
    this.examRatio,
    this.tdTpRatio,
    this.isTdTp,
  ) {
    coefficientController.text = coef.toString();
  }

  void dispose() {
    tdController.dispose();
    tpController.dispose();
    examController.dispose();
    coefficientController.dispose();
  }
}

class ModulePreset {
  final String name;
  final double coef;
  final double examRatio;
  final double tdTpRatio;
  final bool isTdTp;

  ModulePreset(
      this.name, this.coef, this.examRatio, this.tdTpRatio, this.isTdTp);
}

final Map<String, Map<String, List<ModulePreset>>> presets = {
  'ing-1': {
    's1': [
      ModulePreset('Analyse 1', 6, 0.6, 0.4, false),
      ModulePreset('Algèbre 1', 4, 0.6, 0.4, false),
      ModulePreset('ADO1', 4, 0.6, 0.4, false),
      ModulePreset('SE1', 4, 0.6, 0.4, false),
      ModulePreset('WEB', 1, 0.6, 0.4, false),
      ModulePreset('ASD 1', 6, 0.6, 0.4, true),
      ModulePreset('Tech', 1, 1, 1, false),
    ],
    's2': [
      ModulePreset('Analyse 2', 6, 0.6, 0.4, false),
      ModulePreset('Algèbre 2', 4, 0.6, 0.4, false),
      ModulePreset('Logique', 4, 0.6, 0.4, false),
      ModulePreset('PS 1', 4, 0.6, 0.4, false),
      ModulePreset('Tech', 1, 1, 1, false),
      ModulePreset('SE 2', 6, 0.6, 0.4, true),
      ModulePreset('ASD 2', 6, 0.6, 0.4, false),
    ],
  }
};

double calculateSemesterAverage(List<Module> modules) {
  double modAvgXCoef = 0;
  double totalCoefficient = 0;

  for (var module in modules) {
    double tdGrade = double.tryParse(module.tdController.text) ?? 0.0;
    double tpGrade = double.tryParse(module.tpController.text) ?? 0.0;
    double examGrade = double.tryParse(module.examController.text) ?? 0.0;
    double coefficient =
        double.tryParse(module.coefficientController.text) ?? 1.0;
    totalCoefficient += coefficient;

    if (module.isTdTp) {
      module.modAvg = (examGrade * module.examRatio) +
          (((tdGrade + tpGrade) / 2) * module.tdTpRatio);
    } else {
      module.modAvg = (examGrade * module.examRatio) +
          (((tdGrade + tpGrade)) * module.tdTpRatio);
    }

    modAvgXCoef += (module.modAvg * coefficient);
    module.modAvg = module.modAvg > 20.00 ? 20.00 : module.modAvg;
  }

  return (modAvgXCoef / totalCoefficient) == 0
      ? 0
      : (modAvgXCoef / totalCoefficient);
}

List<Module> applyPreset(String presetKey) {
  List<Module> modules = [];
  for (var presetList in presets[presetKey]!.values) {
    for (var preset in presetList) {
      modules.add(Module(preset.name, preset.coef, preset.examRatio,
          preset.tdTpRatio, preset.isTdTp));
    }
  }
  return modules;
}
