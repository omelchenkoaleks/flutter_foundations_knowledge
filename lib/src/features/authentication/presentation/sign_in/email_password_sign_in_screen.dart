import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/custom_text_button.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/primary_button.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/responsive_scrollable_card.dart';
import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';
import 'package:flutter_foundations_knowledge/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:flutter_foundations_knowledge/src/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';

class EmailPasswordSignInScreen extends StatelessWidget {
  const EmailPasswordSignInScreen({Key? key, required this.formType})
      : super(key: key);
  final EmailPasswordSignInFormType formType;

  static const emailKey = Key('email');
  static const passwordKey = Key('password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'.hardcoded)),
      body: EmailPasswordSignInContents(
        formType: formType,
        onSignedIn: () => Navigator.of(context).pop(),
      ),
    );
  }
}

class EmailPasswordSignInContents extends StatefulWidget {
  const EmailPasswordSignInContents({
    Key? key,
    this.onSignedIn,
    required this.formType,
  }) : super(key: key);
  final VoidCallback? onSignedIn;

  final EmailPasswordSignInFormType formType;
  @override
  State<EmailPasswordSignInContents> createState() =>
      _EmailPasswordSignInContentsState();
}

class _EmailPasswordSignInContentsState
    extends State<EmailPasswordSignInContents> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _submitted = false;
  late var _state =
      EmailPasswordSignInState(formType: widget.formType, isLoading: false);

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(EmailPasswordSignInState state) async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      // TODO: Authentication logic
      widget.onSignedIn?.call();
    }
  }

  void _emailEditingComplete(EmailPasswordSignInState state) {
    if (state.canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete(EmailPasswordSignInState state) {
    if (!state.canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit(state);
  }

  void _updateFormType(EmailPasswordSignInFormType formType) {
    setState(() => _state = _state.copyWith(formType: formType));
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollableCard(
      child: FocusScope(
        node: _node,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              gapH8,
              TextFormField(
                key: EmailPasswordSignInScreen.emailKey,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email'.hardcoded,
                  hintText: 'test@test.com'.hardcoded,
                  enabled: !_state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    !_submitted ? null : _state.emailErrorText(email ?? ''),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _emailEditingComplete(_state),
                inputFormatters: <TextInputFormatter>[
                  ValidatorInputFormatter(
                      editingValidator: EmailEditingRegexValidator()),
                ],
              ),
              gapH8,
              TextFormField(
                key: EmailPasswordSignInScreen.passwordKey,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: _state.passwordLabelText,
                  enabled: !_state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => !_submitted
                    ? null
                    : _state.passwordErrorText(password ?? ''),
                obscureText: true,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _passwordEditingComplete(_state),
              ),
              gapH8,
              PrimaryButton(
                text: _state.primaryButtonText,
                isLoading: _state.isLoading,
                onPressed: _state.isLoading ? null : () => _submit(_state),
              ),
              gapH8,
              CustomTextButton(
                text: _state.secondaryButtonText,
                onPressed: _state.isLoading
                    ? null
                    : () => _updateFormType(_state.secondaryActionFormType),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
