class NewPetValidators {
  static String? nameValidator(String? value) {
    //Puede venir vacio :C, no permite signos si no hay textos previamente
    var regExpr =
        RegExp(r'^(?!\s*$)[A-Za-z0-9]+(?:[A-Za-z0-9]*[\W_]+[A-Za-z0-9]+)*$');
    if (!regExpr.hasMatch(value ?? "")) {
      return 'Sacate las zapatillas';
    }
    return null;
  }

  static String? descriptionValidator(String? value) {
    //Puede venir vacio :C, no permite signos si no hay textos previamente
    var regExpr =
        RegExp(r'^(?!\s*$)[A-Za-z0-9]+(?:[A-Za-z0-9]*[\W_]+[A-Za-z0-9]+)*$');
    if (!regExpr.hasMatch(value ?? "")) {
      return 'Sacate las zapatillas';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    //Puede venir vacio :C, no permite signos si no hay textos previamente

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contraseña no puede estar vacia';
    }
    if (value.length < 6) {
      return 'Contraseña no puede tener menos de 6 caracteres';
    }
    return null;
  }
}
