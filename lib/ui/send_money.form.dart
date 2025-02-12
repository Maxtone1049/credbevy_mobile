// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AmountValueKey = 'amount';
const String IdValueKey = 'id';
const String ReferenceValueKey = 'reference';
const String NameValueKey = 'name';

final Map<String, TextEditingController> _SendMoneyViewTextEditingControllers =
    {};

final Map<String, FocusNode> _SendMoneyViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SendMoneyViewTextValidations = {
  AmountValueKey: null,
  IdValueKey: null,
  ReferenceValueKey: null,
  NameValueKey: null,
};

mixin $SendMoneyView {
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get idController =>
      _getFormTextEditingController(IdValueKey);
  TextEditingController get referenceController =>
      _getFormTextEditingController(ReferenceValueKey);
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);

  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get idFocusNode => _getFormFocusNode(IdValueKey);
  FocusNode get referenceFocusNode => _getFormFocusNode(ReferenceValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SendMoneyViewTextEditingControllers.containsKey(key)) {
      return _SendMoneyViewTextEditingControllers[key]!;
    }

    _SendMoneyViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SendMoneyViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SendMoneyViewFocusNodes.containsKey(key)) {
      return _SendMoneyViewFocusNodes[key]!;
    }
    _SendMoneyViewFocusNodes[key] = FocusNode();
    return _SendMoneyViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    amountController.addListener(() => _updateFormData(model));
    idController.addListener(() => _updateFormData(model));
    referenceController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));
    idController.addListener(() => _updateFormData(model));
    referenceController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AmountValueKey: amountController.text,
          IdValueKey: idController.text,
          ReferenceValueKey: referenceController.text,
          NameValueKey: nameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SendMoneyViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SendMoneyViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SendMoneyViewTextEditingControllers.clear();
    _SendMoneyViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get idValue => this.formValueMap[IdValueKey] as String?;
  String? get referenceValue => this.formValueMap[ReferenceValueKey] as String?;
  String? get nameValue => this.formValueMap[NameValueKey] as String?;

  set amountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmountValueKey: value}),
    );

    if (_SendMoneyViewTextEditingControllers.containsKey(AmountValueKey)) {
      _SendMoneyViewTextEditingControllers[AmountValueKey]?.text = value ?? '';
    }
  }

  set idValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IdValueKey: value}),
    );

    if (_SendMoneyViewTextEditingControllers.containsKey(IdValueKey)) {
      _SendMoneyViewTextEditingControllers[IdValueKey]?.text = value ?? '';
    }
  }

  set referenceValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ReferenceValueKey: value}),
    );

    if (_SendMoneyViewTextEditingControllers.containsKey(ReferenceValueKey)) {
      _SendMoneyViewTextEditingControllers[ReferenceValueKey]?.text =
          value ?? '';
    }
  }

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_SendMoneyViewTextEditingControllers.containsKey(NameValueKey)) {
      _SendMoneyViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);
  bool get hasId =>
      this.formValueMap.containsKey(IdValueKey) &&
      (idValue?.isNotEmpty ?? false);
  bool get hasReference =>
      this.formValueMap.containsKey(ReferenceValueKey) &&
      (referenceValue?.isNotEmpty ?? false);
  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);

  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasIdValidationMessage =>
      this.fieldsValidationMessages[IdValueKey]?.isNotEmpty ?? false;
  bool get hasReferenceValidationMessage =>
      this.fieldsValidationMessages[ReferenceValueKey]?.isNotEmpty ?? false;
  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;

  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get idValidationMessage => this.fieldsValidationMessages[IdValueKey];
  String? get referenceValidationMessage =>
      this.fieldsValidationMessages[ReferenceValueKey];
  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
}

extension Methods on FormStateHelper {
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IdValueKey] = validationMessage;
  setReferenceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ReferenceValueKey] = validationMessage;
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    amountValue = '';
    idValue = '';
    referenceValue = '';
    nameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AmountValueKey: getValidationMessage(AmountValueKey),
      IdValueKey: getValidationMessage(IdValueKey),
      ReferenceValueKey: getValidationMessage(ReferenceValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SendMoneyViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SendMoneyViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AmountValueKey: getValidationMessage(AmountValueKey),
      IdValueKey: getValidationMessage(IdValueKey),
      ReferenceValueKey: getValidationMessage(ReferenceValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
    });
