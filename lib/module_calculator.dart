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

// ModulePreset class for presets
class ModulePreset {
  final String name;
  final double coef;
  final double examRatio;
  final double tdTpRatio;
  final bool isTdTp;

  ModulePreset(
      this.name, this.coef, this.examRatio, this.tdTpRatio, this.isTdTp);
}

// Preset data (ING-1 with modules and coefficients)
final Map<String, List<ModulePreset>> presets = {
  'Informatique ING S1': [
    ModulePreset('Analyse 1', 6, 0.6, 0.4, false),
    ModulePreset('Algèbre 1', 4, 0.6, 0.4, false),
    ModulePreset('ADO1', 4, 0.6, 0.4, false),
    ModulePreset('SE1', 4, 0.6, 0.4, false),
    ModulePreset('WEB', 1, 0.6, 0.4, false),
    ModulePreset('ASD 1', 6, 0.6, 0.4, true),
    ModulePreset('Tech', 1, 1, 1, false),
  ],
  'Informatique ING S2': [
    ModulePreset('Analyse 2', 6, 0.6, 0.4, false),
    ModulePreset('Algèbre 2', 4, 0.6, 0.4, false),
    ModulePreset('Logique', 4, 0.6, 0.4, false),
    ModulePreset('PS 1', 4, 0.6, 0.4, false),
    ModulePreset('Tech', 1, 1, 1, false),
    ModulePreset('SE 2', 6, 0.6, 0.4, true),
    ModulePreset('ASD 2', 6, 0.6, 0.4, false),
  ],
  'Informatique ING S3': [
    ModulePreset('SFSD', 5, 0.6, 0.4, false),
    ModulePreset('POO 1', 5, 0.6, 0.4, false),
    ModulePreset('ADO 2', 5, 0.6, 0.4, false),
    ModulePreset('AC 3', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 3', 4, 0.6, 0.4, false),
    ModulePreset('Analyse 3', 4, 0.6, 0.4, false),
    ModulePreset('PS 2', 2, 0.6, 0.4, false),
    ModulePreset('Entreprenariat', 1, 1, 1, false),
  ],
  'Informatique ING S4': [
    ModulePreset('POO 2', 6, 0.6, 0.4, false),
    ModulePreset('SI', 3, 0.6, 0.4, false),
    ModulePreset('RI', 4, 0.6, 0.4, false),
    ModulePreset('BD', 3, 0.6, 0.4, false),
    ModulePreset('Langages', 3, 0.6, 0.4, false),
    ModulePreset('TG', 3, 0.6, 0.4, false),
    ModulePreset('Projet', 6, 0.6, 0.4, false),
    ModulePreset('Anglais 2', 1, 1, 1, false),
  ],
  'Informatique LMD S1': [
    ModulePreset('Analyse 1', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 1', 3, 0.6, 0.4, false),
    ModulePreset('ASD 1', 4, 0.6, 0.4, true),
    ModulePreset('SM 1', 3, 0.6, 0.4, false),
    ModulePreset('Terminologie', 1, 1, 1, false),
    ModulePreset('Langue étrangère 1', 1, 1, 1, false),
    ModulePreset('Physique 1', 2, 0.6, 0.4, false),
  ],
  'Informatique LMD S2': [
    ModulePreset('Analyse 2', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 2', 2, 0.6, 0.4, false),
    ModulePreset('ASD 2', 4, 0.6, 0.4, true),
    ModulePreset('SM 2', 2, 0.6, 0.4, false),
    ModulePreset('PS 1', 2, 0.6, 0.4, false),
    ModulePreset('Techno', 1, 1, 1, false),
    ModulePreset('Outils de programmation', 1, 0.6, 0.4, false),
    ModulePreset('Physique 2', 2, 0.6, 0.4, false),
  ],
  'Informatique LMD S3': [
    ModulePreset('ADO 1', 3, 0.6, 0.4, true),
    ModulePreset('ASD 3', 3, 0.6, 0.4, true),
    ModulePreset('SI', 3, 0.6, 0.4, true),
    ModulePreset('TG', 2, 0.6, 0.4, false),
    ModulePreset('MN', 2, 0.6, 0.4, false),
    ModulePreset('Logique', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 2', 1, 1, 1, false),
  ],
  'Informatique LMD S4': [
    ModulePreset('Théories des langages', 2, 0.6, 0.4, true),
    ModulePreset('SE 1', 3, 0.6, 0.4, true),
    ModulePreset('BD', 3, 0.6, 0.4, true),
    ModulePreset('Réseaux', 3, 0.6, 0.4, true),
    ModulePreset('POO', 2, 0.6, 0.4, false),
    ModulePreset('Web', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 3', 1, 1, 1, false),
  ],
  'Informatique LMD S5': [
    ModulePreset('Théories des langages', 2, 0.6, 0.4, true),
    ModulePreset('SE 1', 3, 0.6, 0.4, true),
    ModulePreset('BD', 3, 0.6, 0.4, true),
    ModulePreset('Réseaux', 3, 0.6, 0.4, true),
    ModulePreset('POO', 2, 0.6, 0.4, false),
    ModulePreset('Web', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 3', 1, 1, 1, false),
  ],
  'Informatique LMD S6': [
    ModulePreset('Théories des langages', 2, 0.6, 0.4, true),
    ModulePreset('SE 1', 3, 0.6, 0.4, true),
    ModulePreset('BD', 3, 0.6, 0.4, true),
    ModulePreset('Réseaux', 3, 0.6, 0.4, true),
    ModulePreset('POO', 2, 0.6, 0.4, false),
    ModulePreset('Web', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 3', 1, 1, 1, false),
  ],
  'Informatique LMD S7': [
    ModulePreset('Théories des langages', 2, 0.6, 0.4, true),
    ModulePreset('SE 1', 3, 0.6, 0.4, true),
    ModulePreset('BD', 3, 0.6, 0.4, true),
    ModulePreset('Réseaux', 3, 0.6, 0.4, true),
    ModulePreset('POO', 2, 0.6, 0.4, false),
    ModulePreset('Web', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 3', 1, 1, 1, false),
  ],
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
  for (var preset in presets[presetKey]!) {
    modules.add(Module(preset.name, preset.coef, preset.examRatio,
        preset.tdTpRatio, preset.isTdTp));
  }
  return modules;
}
