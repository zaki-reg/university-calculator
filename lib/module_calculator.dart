import 'package:flutter/material.dart';

// Module class to hold module data and its associated controllers
class Module {
  final String name;
  final double coef;
  final double examRatio; // Add examRatio to the Module class
  final double tdTpRatio; // Add tdTpRatio to the Module class
  final bool isTdTp;

  final TextEditingController tdController = TextEditingController();
  final TextEditingController tpController = TextEditingController();
  final TextEditingController examController = TextEditingController();
  final TextEditingController coefficientController = TextEditingController();

  // Modify the constructor to accept examRatio and tdTpRatio
  Module(this.name, this.coef, this.examRatio, this.tdTpRatio, this.isTdTp) {
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
  'ING-SEM1': [
    ModulePreset('Analyse 1', 6, 0.6, 0.4, false),
    ModulePreset('Algèbre 1', 4, 0.6, 0.4, false),
    ModulePreset('ADO1', 4, 0.6, 0.4, false),
    ModulePreset('SE1', 4, 0.6, 0.4, false),
    ModulePreset('WEB', 1, 0.6, 0.4, false),
    ModulePreset('ASD 1', 6, 0.6, 0.4, true),
    ModulePreset('Tech', 1, 1, 1, false),
  ],
  'ING-SEM2': [
    ModulePreset('Analyse 2', 6, 0.6, 0.4, false),
    ModulePreset('Algèbre 2', 4, 0.6, 0.4, false),
    ModulePreset('Logique', 4, 0.6, 0.4, false),
    ModulePreset('PS 1', 4, 0.6, 0.4, false),
    ModulePreset('Tech', 1, 1, 1, false),
    ModulePreset('SE 2', 6, 0.6, 0.4, true),
    ModulePreset('ASD 2', 6, 0.6, 0.4, false),
  ],
  'ING-SEM3': [
    ModulePreset('SFSD', 5, 0.6, 0.4, false),
    ModulePreset('POO 1', 5, 0.6, 0.4, false),
    ModulePreset('ADO 2', 5, 0.6, 0.4, false),
    ModulePreset('AC 3', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 3', 4, 0.6, 0.4, false),
    ModulePreset('Analyse 3', 4, 0.6, 0.4, false),
    ModulePreset('PS 2', 2, 0.6, 0.4, false),
    ModulePreset('Entreprenariat', 1, 1, 1, false),
  ],
  'ING-SEM4': [
    ModulePreset('POO 2', 6, 0.6, 0.4, false),
    ModulePreset('SI', 3, 0.6, 0.4, false),
    ModulePreset('RI', 4, 0.6, 0.4, false),
    ModulePreset('BD', 3, 0.6, 0.4, false),
    ModulePreset('Langages', 3, 0.6, 0.4, false),
    ModulePreset('TG', 3, 0.6, 0.4, false),
    ModulePreset('Projet', 6, 0.6, 0.4, false),
    ModulePreset('Anglais 2', 1, 1, 1, false),
  ],
  'INF-SEM1': [
    ModulePreset('Analyse 1', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 1', 3, 0.6, 0.4, false),
    ModulePreset('ASD 1', 4, 0.6, 0.4, true),
    ModulePreset('SM 1', 3, 0.6, 0.4, false),
    ModulePreset('Terminologie', 1, 1, 1, false),
    ModulePreset('Langue étrangère 1', 1, 1, 1, false),
    ModulePreset('Physique 1', 2, 0.6, 0.4, false),
  ],
  'INF-SEM2': [
    ModulePreset('Analyse 2', 4, 0.6, 0.4, false),
    ModulePreset('Algèbre 2', 2, 0.6, 0.4, false),
    ModulePreset('ASD 2', 4, 0.6, 0.4, true),
    ModulePreset('SM 2', 2, 0.6, 0.4, false),
    ModulePreset('PS 1', 2, 0.6, 0.4, false),
    ModulePreset('Techno', 1, 1, 1, false),
    ModulePreset('Outils de programmation', 1, 0.6, 0.4, false),
    ModulePreset('Physique 2', 2, 0.6, 0.4, false),
  ],
  'INF-SEM3': [
    ModulePreset('ADO 1', 3, 0.6, 0.4, true),
    ModulePreset('ASD 3', 3, 0.6, 0.4, true),
    ModulePreset('SI', 3, 0.6, 0.4, true),
    ModulePreset('TG', 2, 0.6, 0.4, false),
    ModulePreset('MN', 2, 0.6, 0.4, false),
    ModulePreset('Logique', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 2', 1, 1, 1, false),
  ],
  'INF-SEM4': [
    ModulePreset('Théories des langages', 2, 0.6, 0.4, true),
    ModulePreset('SE 1', 3, 0.6, 0.4, true),
    ModulePreset('BD', 3, 0.6, 0.4, true),
    ModulePreset('Réseaux', 3, 0.6, 0.4, true),
    ModulePreset('POO', 2, 0.6, 0.4, false),
    ModulePreset('Web', 2, 0.6, 0.4, false),
    ModulePreset('Langue étrangère 3', 1, 1, 1, false),
  ],
};

// Function to calculate the semester average based on modules
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
      double modAvg = (examGrade * module.examRatio) +
          (((tdGrade + tpGrade) / 2) * module.tdTpRatio);
      modAvgXCoef += (modAvg * coefficient);
    } else {
      double modAvg = (examGrade * module.examRatio) +
          (((tdGrade + tpGrade)) * module.tdTpRatio);
      modAvgXCoef += (modAvg * coefficient);
    }
  }

  return modAvgXCoef / totalCoefficient;
}

List<Module> applyPreset(String presetKey) {
  List<Module> modules = [];
  for (var preset in presets[presetKey]!) {
    modules.add(Module(preset.name, preset.coef, preset.examRatio,
        preset.tdTpRatio, preset.isTdTp));
  }
  return modules;
}
